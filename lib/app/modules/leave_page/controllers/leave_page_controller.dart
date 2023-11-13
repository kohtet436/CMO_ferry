import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/data/models/request_models/leave_request_model.dart';
import 'package:cmo_ferry/app/modules/leave_history_page/controllers/leave_history_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/helper/helper.dart';
import '../../../data/repository/ferry_leave_repository.dart';

class LeavePageController extends GetxController {
  final RxBool _isload = false.obs;
  get isload => _isload.value;
  set isload(val) => _isload.value = val;
  var selectedDate = DateTime.now().obs;
  TextEditingController leaveTextEditingController = TextEditingController();
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            onPrimary: Colors.white,
            primary: ColorManager.primaryColor,
            onSurface: ColorManager.primaryColor,
          )),
          child: child!),
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      isload = true;
      selectedDate.value = pickedDate;
    }
  }

  LeaveHistoryPageController leaveHistoryPageController =
      Get.find<LeaveHistoryPageController>();

  final RxString _message = ''.obs;
  get message => _message.value;
  set message(val) => _message.value;
  final RxString _errormessage = ''.obs;
  get errormessage => _errormessage.value;
  set errormessage(val) => _errormessage.value;
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  FerryLeaveRepository repository = Get.find();
  leaveSubmit() async {
    if (isload == false) {
      return Helper.showQuickToast("Please select date");
    }
    _isLoading.value = true;
    try {
      var data = await repository.requestFerryLeave(LeaveRequestModel(
          date: DateFormat('yyyy-MM-dd').format(selectedDate.value),
          routeType: select,
          reason: leaveTextEditingController.text));

      data.fold((data) {
        return _message.value = data;
      }, (error) {
        _errormessage.value = error.message;
        return Helper.console("weei${error.message}");
      });
    } finally {
      _isLoading.value = false;
      Get.dialog(AlertDialog(
        title: Text(message.toString()),
        content: Text(message.toString()),
        actions: [
          ElevatedButton(
              style: newElevatedStyel,
              onPressed: () {
                leaveTextEditingController.clear();
                leaveHistoryPageController.leaveHistory();
                Get.back();
                Get.back();
                isload = false;
                message = '';
              },
              child: Text(
                "OK",
                style: getRegularStyle(color: Colors.white),
              ))
        ],
      ));
    }
  }

  final RxString _select = "Full Day".obs;
  get select => _select.value;
  set select(val) => _select.value = val;

  void radioSelect(var val) {
    _select.value = val;
  }
}
