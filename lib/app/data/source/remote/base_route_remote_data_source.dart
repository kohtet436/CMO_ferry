import '../../models/response_models/base_response.dart';
import '../../models/response_models/base_routes_model.dart';
import '../../remote/route_api_service.dart';

abstract class BaseRouteRemoteDataSource {
  Future<BaseResponse<BaseRouteModel>> getBaseRoute(String baserouteId);
}

class BaseRouteRemoteDataSourceImpl extends BaseRouteRemoteDataSource {
  final RouteApiService apiServices;

  BaseRouteRemoteDataSourceImpl(this.apiServices);
  @override
  Future<BaseResponse<BaseRouteModel>> getBaseRoute(String baserouteId) {
    return apiServices.getBaseRoute(baserouteId);
  }
}
