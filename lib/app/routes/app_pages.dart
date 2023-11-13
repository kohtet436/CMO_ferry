import 'package:get/get.dart';

import '../modules/base_route_detail_page/bindings/base_route_detail_page_binding.dart';
import '../modules/base_route_detail_page/views/base_route_detail_page_view.dart';
import '../modules/ferry_request_page/bindings/ferry_request_page_binding.dart';
import '../modules/ferry_request_page/views/ferry_request_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leave_history_page/bindings/leave_history_page_binding.dart';
import '../modules/leave_history_page/views/leave_history_page_view.dart';
import '../modules/leave_page/bindings/leave_page_binding.dart';
import '../modules/leave_page/views/leave_page_view.dart';
import '../modules/log_in/bindings/log_in_page_binding.dart';
import '../modules/log_in/views/log_in_page_view.dart';
import '../modules/navigation_page/bindings/navigation_page_binding.dart';
import '../modules/navigation_page/views/navigation_page_view.dart';
import '../modules/other_page/bindings/other_page_binding.dart';
import '../modules/other_page/bindings/other_page_binding.dart';
import '../modules/other_page/views/other_page_view.dart';
import '../modules/other_page/views/other_page_view.dart';
import '../modules/password_change/bindings/password_change_binding.dart';
import '../modules/password_change/views/password_change_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // static const NAVIGATION=Routes.NAVIGATION_PAGE;
  static const INITIAL = Routes.SPLASH_PAGE;
  // static const EmployeeProfile = Routes.EMPLOYEE_PROFILE;
  // static const ChangePassword = Routes.PASSWORD_CHANGE;
  // // static const Login = Routes.LOGIN;
  // static const BaseRouteDetailPage = Routes.BASE_ROUTE_DETAIL_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginPageView(),
      binding: LogInPageBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_CHANGE,
      page: () => const PasswordChangePageView(),
      binding: PasswordChangePageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_PAGE,
      page: () => NavigationPageView(),
      binding: NavigationPageBinding(),
    ),
    GetPage(
      name: _Paths.BASE_ROUTE_DETAIL_PAGE,
      page: () => const BaseRouteDetailPageView(),
      binding: BaseRouteDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.OTHER_PAGE,
      page: () => OtherPageView(),
      binding: OtherPageBinding(),
    ),
    GetPage(
      name: _Paths.LEAVE_PAGE,
      page: () => const LeavePageView(),
      binding: LeavePageBinding(),
    ),
    GetPage(
      name: _Paths.LEAVE_HISTORY_PAGE,
      page: () => const LeaveHistoryPageView(),
      binding: LeaveHistoryPageBinding(),
    ),
    GetPage(
      name: _Paths.FERRY_REQUEST_PAGE,
      page: () => const FerryRequestPageView(),
      binding: FerryRequestPageBinding(),
    ),
  ];
}
