import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/font_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:cmo_ferry/app/core/widget/choose_ferry_stop.dart';
import 'package:cmo_ferry/app/modules/base_route_detail_page/bindings/base_route_detail_page_binding.dart';
import 'package:cmo_ferry/app/modules/base_route_detail_page/controllers/base_route_detail_page_controller.dart';
import 'package:cmo_ferry/app/modules/base_route_detail_page/views/base_route_detail_page_view.dart';
import 'package:cmo_ferry/app/modules/other_page/bindings/other_page_binding.dart';
import 'package:cmo_ferry/app/modules/other_page/views/other_page_view.dart';
import 'package:cmo_ferry/app/modules/home/bindings/home_binding.dart';
import 'package:cmo_ferry/app/modules/home/views/home_view.dart';
import 'package:cmo_ferry/app/modules/leave_history_page/bindings/leave_history_page_binding.dart';
import 'package:cmo_ferry/app/modules/leave_history_page/views/leave_history_page_view.dart';
import 'package:cmo_ferry/app/modules/leave_page/bindings/leave_page_binding.dart';
import 'package:cmo_ferry/app/modules/leave_page/views/leave_page_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../controllers/navigation_page_controller.dart';

class NavigationPageView extends StatelessWidget {
  final controller = Get.put(NavigationPageController());

  NavigationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _initializePage(controller.pageIndex.value),
        bottomNavigationBar: Card(
          elevation: 4,
          margin: EdgeInsets.zero,
          child: SalomonBottomBar(
            itemPadding: WidgetUtil.defaultAllPadding(),
            currentIndex: controller.pageIndex.value,
            selectedItemColor: ColorManager.primaryColor,
            unselectedItemColor: ColorManager.darkGrey,
            onTap: (i) {
              controller.changePage(i);
              _initializePage(i);
            },
            items: [
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.route,
                    size: AppSize.navigationBarIconSize),
                title: const RegularText(
                  text: AppStrings.routePageNavLabel,
                ),
              ),
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.circleInfo,
                    size: AppSize.navigationBarIconSize),
                title: const RegularText(
                  text: AppStrings.informationPageNavLabel,
                ),
              ),
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.calendarMinus,
                    size: AppSize.navigationBarIconSize),
                title: const RegularText(
                  text: AppStrings.leavePageNavLabel,
                ),
              ),
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.barsProgress,
                    size: AppSize.navigationBarIconSize),
                title: const RegularText(
                  text: AppStrings.otherPageNavLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Widget> _listOfWidget = <Widget>[
     HomeView(),
    const BaseRouteDetailPageView(),
    ChooseFerryStop(),
    // OtherPageView(),
  ];

  Widget _initializePage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        HomeBinding().dependencies();
        return  HomeView();
      case 1:
        BaseRouteDetailPageBinding().dependencies();
        return const BaseRouteDetailPageView();
      case 2:
        LeaveHistoryPageBinding().dependencies();
        return const LeaveHistoryPageView();
      // case 3:
        // OtherPageBinding().dependencies();
        // return OtherPageView();
      default:
        HomeBinding().dependencies();
        return  HomeView();
    }
  }
}
