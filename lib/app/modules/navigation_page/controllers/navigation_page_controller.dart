import 'package:cmo_ferry/app/modules/base_route_detail_page/bindings/base_route_detail_page_binding.dart';
import 'package:cmo_ferry/app/modules/other_page/bindings/other_page_binding.dart';
import 'package:cmo_ferry/app/modules/leave_page/bindings/leave_page_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/bindings/home_binding.dart';

class NavigationPageController extends GetxController {
  final pageIndex = 0.obs;

  final pageController = PageController().obs;

  @override
  void onInit() {
    // HomeBinding().dependencies();
    // BaseRouteDetailPageBinding().dependencies();
    // LeavePageBinding().dependencies();
    // OtherPageBinding().dependencies();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    pageController.value.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(int pageIndex) {
    this.pageIndex(pageIndex);
  }
}
