enum Flavor {
  STAGING, PROD
}

class FlavorValues {
  final String? bundleID;
  final String? appID;
  final String? emsBaseUrl;
  final String? rmsBaseUrl;
  final String? sentryUrl;
  final String? dynamicLinkUrl;

  FlavorValues({this.bundleID, this.appID, this.emsBaseUrl,this.rmsBaseUrl, this.sentryUrl, this.dynamicLinkUrl});
}


class FlavorConfig {
  final Flavor flavor;
  final String env;
  final String name;
  final FlavorValues? values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String env,
    required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
        flavor, name, env, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.env, this.values);

  static FlavorConfig? get instance => _instance;

  static bool isStaging() => _instance!.flavor == Flavor.STAGING;

  static bool isProduction() => _instance!.flavor == Flavor.PROD;
}