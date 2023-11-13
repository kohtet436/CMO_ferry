import 'package:cmo_ferry/app/core/helper/app_prefs.dart';
import 'package:cmo_ferry/app/core/helper/constant.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/data/repository/ferry_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/helper/app_enum.dart';
import '../../../core/helper/di.dart';
import '../../../core/helper/helper.dart';
import '../../../data/models/response_models/employee.dart';
import '../../../data/repository/employee_repository.dart';

class OtherPageController extends GetxController {
  final RxBool isLoading = true.obs;

  final Rx<TextEditingController> phoneNumberTextController = TextEditingController().obs;

  final Rx<TextEditingController> addressTextController = TextEditingController().obs;

  final successMessage = "".obs;

  FocusNode phoneNumberNode = FocusNode();
  FocusNode addressNode = FocusNode();

  final employee = Rxn<Employee>();

  final EmployeeRepository repository = Get.find();
  final FerryRequestRepository ferryRequestRepository = Get.find();

  var selectedImagePath = ''.obs;

  final Rx<AppLanguage> language = AppLanguage.ENG.obs;

  final Rx<FerryStatus> ferryStatus = FerryStatus.NONE.obs;

  @override
  void onInit() {

    getEmployeeData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    phoneNumberTextController.value.dispose();
    addressTextController.value.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateLocale() {
    Locale language = instance.get<AppPreference>().getAppLanguage();
    Get.updateLocale(language);
    if (language == MM_LOCALE) {
      this.language(AppLanguage.MM);
    } else {
      this.language(AppLanguage.ENG);
    }
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Helper.console("No image selected");
    }
  }

  void updateEmployeeProfile(String phoneNumber, String address) async {
    try {
      isLoading(true);
      var data = await repository.updateEmployeeProfile(phoneNumber, address);
      data.fold((data) {
        employee(data);
      }, (error) => Helper.console(error.message));
    } finally {
      isLoading(false);
      Helper.console("Employee ferry status ==> ${employee.value!.ferryStatus}");
      ferryStatus.value = employee.value!.ferryStatus;
      Helper.console(ferryStatus.value.toString());
      phoneNumberTextController.value.text = employee.value!.phoneNumber;
      addressTextController.value.text = employee.value!.address;
    }
  }

  void getEmployeeData() async {
    try {
      isLoading(true);
      var data = await repository.getEmployeeProfileData();
      data.fold(
        (data) {
          employee.value = data;
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
      ferryStatus.value = employee.value!.ferryStatus;
      Helper.console(ferryStatus.value.toString());
      phoneNumberTextController.value.text = employee.value!.phoneNumber;
      addressTextController.value.text = employee.value!.address;
    }
  }

  void cancelFerryRequest(DateTime requestDate) async {
    try {
      isLoading(true);
      var data = await ferryRequestRepository.sendFerryRequest(employee.value!.ferryStopId!, FerryRequestType.CANCEL, requestDate);
      data.fold(
        (data) => Helper.showQuickToast(AppStrings.successToast.tr),
        (error) => Helper.showQuickToast(error.message),
      );
    } finally {
      isLoading(false);
    }
  }
}
