import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';
import 'package:get/get.dart';

import '../../models/request_models/ferry_request.dart';
import '../../models/response_models/base_response.dart';
import '../../models/response_models/ferry_request_response.dart';
import '../../models/response_models/ferry_stop.dart';

abstract class FerryRequestRemoteDataSource{
  Future<BaseResponse<Township>> getAllTownships();
  Future<BaseResponse<Road>> getAllRoads();
  Future<BaseResponse<FerryStop>> getAllFerryStops(String roadId,String townshipId);

  Future<BaseResponse<FerryRequestResponse>> sendFerryRequest(FerryRequest ferryRequest);
}
class FerryRequestRemoteDataSourceImpl extends FerryRequestRemoteDataSource{
  final EmsApiService emsApiService;

  FerryRequestRemoteDataSourceImpl({required this.emsApiService});

  @override
  Future<BaseResponse<FerryStop>> getAllFerryStops(String roadId, String townshipId) {
    return emsApiService.getAllFerryStops(roadId, townshipId);
  }

  @override
  Future<BaseResponse<Road>> getAllRoads() {
    return emsApiService.getAllRoads();
  }

  @override
  Future<BaseResponse<Township>> getAllTownships() {
    return emsApiService.getAllTownships();
  }

  @override
  Future<BaseResponse<FerryRequestResponse>> sendFerryRequest(FerryRequest ferryRequest) {
    return emsApiService.requestFerry(ferryRequest);
  }

}