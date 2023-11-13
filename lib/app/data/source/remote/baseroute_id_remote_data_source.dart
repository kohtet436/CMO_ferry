import 'package:cmo_ferry/app/data/remote/route_api_service.dart';

import '../../models/response_models/base_response.dart';
import '../../models/response_models/base_route_id_model.dart';

abstract class GetBaseRouteIdRemoteDataSource{
  Future<BaseResponse<BaseRouteIdModel>> getBaseRouteId();
}

class GetBaseRouteIdRemoteDataSourceImpl extends GetBaseRouteIdRemoteDataSource{
  final RouteApiService apiServices;

  GetBaseRouteIdRemoteDataSourceImpl(this.apiServices);
  @override
  Future<BaseResponse<BaseRouteIdModel>> getBaseRouteId() async{
    return apiServices.getBaseRouteId();
  }

}