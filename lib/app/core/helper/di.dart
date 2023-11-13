import 'package:cmo_ferry/app/core/helper/environment.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:cmo_ferry/flavors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/remote/dio_factory.dart';
import '../../data/remote/route_api_service.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await GetStorage.init();

  final sharedPrefs = GetStorage();
  const secureStorage = FlutterSecureStorage();

  // shared prefs instance
  instance.registerLazySingleton(
    () => sharedPrefs,
  );

  // secure storage instance
  instance.registerLazySingleton(
    () => secureStorage,
  );

  // AppPreference
  instance.registerLazySingleton<AppPreference>(
    () => AppPreference(
      instance(),
      instance(),
    ),
  );

  // DioFactory instance
  instance.registerFactory<DioFactory>(
    () => DioFactory(
      instance(),
    ),
  );
  // ApiService instance
  final dio = instance.get<DioFactory>().getEmsDio();
  instance.registerFactory<EmsApiService>(
    () => EmsApiService(dio),
  );
  
final routeDio = instance.get<DioFactory>().getRmsDio();
  instance.registerFactory<RouteApiService>(
    () => RouteApiService(routeDio),
  );
}
