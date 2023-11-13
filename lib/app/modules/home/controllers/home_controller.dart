import 'package:cmo_ferry/app/data/models/request_models/checkIn_request_model.dart';
import 'package:cmo_ferry/app/data/models/response_models/check_in_out_status_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/helper/app_prefs.dart';
import '../../../core/helper/di.dart';
import '../../../core/helper/helper.dart';
import '../../../data/models/request_models/daily_route_request_model.dart';
import '../../../data/models/response_models/base_route_id_model.dart';
import '../../../data/models/response_models/dialy_route_model.dart';
import '../../../data/repository/baseroute_id_repository.dart';
import '../../../data/repository/daily_route_respository.dart';

class HomeController extends GetxController {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final RxBool _isLoading = true.obs;
  get isLoading => _isLoading.value;
  Rxn<DailyRouteModel> dailyRoute = Rxn<DailyRouteModel>();
  final DailyRouteRepository repository = Get.find();

  @override
  void onInit() async {
//  Future.delayed(const Duration(seconds: 2), () {
      // getDailyRouteData();
getBaseRouteId();
// getDailyRouteData();
      // isAlreadyCheckedInOut();

    // });
    // Future.delayed(const Duration(seconds: 2), () {
    //   getDailyRouteData();
    // });
    // Future.delayed(const Duration(seconds: 4), () {
    // });

    super.onInit();
  }
          final appPrefs = instance.get<AppPreference>();

  String? dailyRouteId;
  
  GetBaseRouteIdRepository getBaseRouteIdRepository = Get.find();
Rxn<BaseRouteIdModel> baseRouteIdModel = Rxn<BaseRouteIdModel>();

 void getBaseRouteId() async {
    try {
     

      Helper.console("getBaseRoute Do");
      final response = await getBaseRouteIdRepository.getBaseRouteId();
      Helper.console("baseRouteIdresponse=>$response");
      response.fold(
        (data) {
          baseRouteIdModel.value = data;
          appPrefs.setBaseRouteId(baseRouteIdModel.value!.id);
      
        },
        (error) {
          if (error.statusCode == 401) {
            print("error");
            // errorMessage(error.message);
          }
        },
      );
    } finally {
    
    }
  }


  void getDailyRouteData() async {
    try {
      var data = await repository.getDailyRoute(DailyRouteRequestModel(
        baseRouteId: appPrefs.getBaseRouteId(),
        // await GetStorage().read('baseRouteId'),
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        routeType: DateTime.now().hour < 12
            ? DailyRouteType.MORNING
            : DailyRouteType.EVENING,
      ));
      data.fold((data) {
        refreshController.refreshCompleted();
        GetStorage().write('dailyRouteId', data.id);
        return dailyRoute.value = data;
      }, (error) {
        refreshController.refreshFailed();

        return Helper.console(error.message);
      });
    } finally {
      _isLoading.value = false;
    }
  }

  final RxBool _ischeckoutStausLoading = true.obs;
  get ischeckoutStatusLoading => _ischeckoutStausLoading.value;
  Rxn<CheckInOutStatusModel> isAlreadyCheckedInOutResponse =
      Rxn<CheckInOutStatusModel>();
  void isAlreadyCheckedInOut() async {
    try {
      _ischeckoutStausLoading.value = true;

      final response = await repository
          .checkInOutStatus(await GetStorage().read('dailyRouteId'));

      response.fold(
        (data) {
          isAlreadyCheckedInOutResponse.value = data;
        },
        (error) {
          if (error.statusCode == 401) {}
        },
      );
    } finally {
      _ischeckoutStausLoading.value = false;
    }
  }

////checkin
  final RxString _message = ''.obs;
  get message => _message.value;
  set message(val) => _message.value;
  final RxBool _checkLoading = false.obs;

  checkOut() async {
    try {
      final hasPermission = await _handleLocationPermission();
      if (hasPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        var data = await repository.checkOut(CheckInRequestModel(
            dailyRouteId: GetStorage().read('dailyRouteId'),
            status: "",
            checkOutLatitude: position.latitude.toString(),
            checkOutLongitude: position.longitude.toString()));

        data.fold((data) {
          return _message.value = data;
        }, (error) {
          return Helper.console("weei${error.message}");
        });
      }
    } finally {
      _checkLoading.value = false;
      isAlreadyCheckedInOut();
    }
  }

  checkIn() async {
    try {
      final hasPermission = await _handleLocationPermission();
      if (hasPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        var data = await repository.checkIn(CheckInRequestModel(
            dailyRouteId: GetStorage().read('dailyRouteId'),
            status: "",
            checkInLatitude: position.latitude.toString(),
            checkInLongitude: position.longitude.toString()));

        data.fold((data) {
          return _message.value = data;
        }, (error) {
          return Helper.console("weei${error.message}");
        });
      }
    } finally {
      _checkLoading.value = false;
      isAlreadyCheckedInOut();
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Please Open Location",
          "Location services are disabled. Please enable the services");
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.whileInUse) {
        await Geolocator.openLocationSettings();
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
              "Please Open Location", "Location permissions are denied");

          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Please Open Location",
            "Location permissions are permanently denied, we cannot request permissions.");

        return false;
      }
      return true;
    }

    return true;
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
