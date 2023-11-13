import 'package:cmo_ferry/app/core/helper/helper.dart';
import 'package:cmo_ferry/app/data/models/response_models/leave_history_model.dart';
import 'package:get/get.dart';

import '../../../data/repository/leave_history_repository.dart';

class LeaveHistoryPageController extends GetxController {
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final leaveHistoryResponse = Rxn<List<LeaveHistoryModel>>();

  @override
  void onInit() {
    leaveHistory();
    super.onInit();
  }

  LeaveHistoryRepository leaveHistoryRepository = Get.find();

  void leaveHistory() async {
    try {
      _isLoading.value = true;
      final response = await leaveHistoryRepository.leaveHistory();

      response.fold(
        (data) {
          leaveHistoryResponse.value = data;
        },
        (error) {
          if (error.statusCode == 401) {
            Helper.console("error $error");
          }
        },
      );
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
