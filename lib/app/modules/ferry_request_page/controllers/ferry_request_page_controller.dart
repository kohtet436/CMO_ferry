import 'package:cmo_ferry/app/core/helper/app_enum.dart';
import 'package:cmo_ferry/app/core/values/font_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/data/models/response_models/ferry_stop.dart';
import 'package:cmo_ferry/app/data/repository/ferry_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/helper.dart';
import '../../../core/util/widget_util.dart';

class FerryRequestPageController extends GetxController {
  final townshipsDropDownList = <DropdownMenuItem>[].obs;
  final roadsDropDownList = <DropdownMenuItem>[].obs;
  final ferryStopsDropDownList = <DropdownMenuItem>[].obs;

  final isLoading = true.obs;

  final townships = <Township>[].obs;
  final roads = <Road>[].obs;
  final ferryStops = <FerryStop>[].obs;

  final townshipValue = RxnString();
  final roadValue = RxnString();
  final ferryStopValue = RxnString();

  final isMM = GetStorage().read('isMM');

  final FerryRequestRepository repository = Get.find();

  final employeeId = Get.parameters['employeeId'] ?? 'this is null';
  final pickedDate = DateTime.now().obs;

  final initialDate = DateTime.now().obs;
  final minDate = DateTime.now().obs;
  final maxDate = DateTime.now().add(const Duration(days: 31)).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getAllTownships() async {
    try {
      isLoading(true);
      final response = await repository.getAllTownships();
      response.fold(
        (data) {
          townships.clear();
          townships.assignAll(data);
        },
        (error) {
          townships.clear();
          Helper.console(error.message);
        },
      );
    } finally {
      isLoading(false);
      Helper.hideLoadingDialog();
      for (final township in townships) {
        Helper.console(township.name);
        townshipsDropDownList.addAll(
          [
            DropdownMenuItem<String>(
              value: township.id,
              child: Padding(
                padding: WidgetUtil.defaultAllHorizontalPadding(),
                child: RegularText(
                  text: isMM ? township.myanmarName : township.name,
                ),
              ),
            ),
            if (township != townships.last)
              const DropdownMenuItem(
                enabled: false,
                child: Divider(),
              ),
          ],
        );
      }
    }
  }

  void getAllRoads() async {
    try {
      isLoading(true);
      final response = await repository.getAllRoads();
      response.fold(
        (data) {
          roads.clear();
          roads.assignAll(data);
        },
        (error) {
          roads.clear();
          Helper.console(error.message);
        },
      );
    } finally {
      isLoading(false);
      Helper.hideLoadingDialog();
      roadsDropDownList.assignAll(roads
          .map(
            (road) => DropdownMenuItem<String>(
              value: road.id,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RegularAutoSizeText(
                  maxFontSize: FontSize.s16,
                  minFontSize: FontSize.s14,
                  text: isMM ? road.myanmarName : road.name,
                ),
              ),
            ),
          )
          .toList());
    }
  }

  Future<void> getAllFerryStops(String roadId, String townshipId) async {
    try {
      isLoading(true);
      Helper.showLoadingDialog();
      final response = await repository.getAllFerryStops(roadValue.value!, townshipValue.value!);
      response.fold(
        (data) {
          ferryStops.clear();
          ferryStops.assignAll(data);
        },
        (error) {
          ferryStops.clear();
          Helper.console(error.message);
        },
      );
    } finally {
      isLoading(false);
      Helper.hideLoadingDialog();
      ferryStopsDropDownList.assignAll(ferryStops
          .map(
            (ferryStop) => DropdownMenuItem<String>(
              value: ferryStop.id,
              child: RegularText(
                text: isMM ? ferryStop.myanmarName : ferryStop.name,
              ),
            ),
          )
          .toList());
    }
  }

  void requestFerry(
    String ferryStopId,
  ) async {
    const requestType = FerryRequestType.NEW;
    try {
      isLoading(true);
      Helper.console("Employee Id is ==> $employeeId");
      final response = await repository.sendFerryRequest(
        ferryStopId,
        requestType,
        pickedDate.value,
      );
      response.fold((data) => data, (error) {
        Helper.console(error.message);
        Helper.showQuickToast(error.message);
      });
    } finally {
      isLoading(false);
    }
  }

  void updateTownshipValue(String value) {
    townshipValue(value);
  }

  void updateRoadValue(String value) {
    roadValue(value);
  }

  void updateFerryStopValue(String value) {
    ferryStopValue(value);
  }

  void clearDataOnClicked() {
    townshipValue.value = null;
    roadValue.value = null;
    ferryStopValue.value = null;
  }

  void updatePickedDate(DateTime dateTime) {
    pickedDate.value = dateTime;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
