import 'package:package_info_plus/package_info_plus.dart';

const EMS_BASE_URL_PROD = "https://apiemployee.fms.stg.citymall.com.mm";
const EMS_BASE_URL_STAGING = "https://apiemployee.fms.dev.citymall.com.mm";

const RMS_BASE_URL_PROD = "https://apiroute.fms.stg.citymall.com.mm";
const RMS_BASE_URL_STAGING = "https://apiroute.fms.dev.citymall.com.mm";

enum EnvironmentType {
  staging(emsBaseUrl: EMS_BASE_URL_STAGING, rmsBaseUrl: RMS_BASE_URL_STAGING),
  prod(emsBaseUrl: RMS_BASE_URL_STAGING, rmsBaseUrl: RMS_BASE_URL_PROD);

  const EnvironmentType({required this.emsBaseUrl, required this.rmsBaseUrl});

  final String emsBaseUrl;
  final String rmsBaseUrl;
}

class Environment {
  static EnvironmentType? _current;

  static Future<EnvironmentType> current() async {
    if (_current != null) {
      return _current!;
    }

    final packageInfo = await PackageInfo.fromPlatform();

    switch (packageInfo.packageName) {
      case "mm.com.cmoit.cmo_ferry.staging":
        _current = EnvironmentType.staging;
        break;
      default:
        _current = EnvironmentType.prod;
    }
    return _current!;
  }
}
