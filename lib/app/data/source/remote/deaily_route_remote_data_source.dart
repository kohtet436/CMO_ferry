import 'package:cmo_ferry/app/data/models/request_models/checkIn_request_model.dart';
import 'package:cmo_ferry/app/data/models/request_models/daily_route_request_model.dart';
import 'package:cmo_ferry/app/data/remote/route_api_service.dart';
import '../../models/response_models/base_response.dart';
import '../../models/response_models/check_in_out_status_model.dart';
import '../../models/response_models/dialy_route_model.dart';

abstract class DailyRouteRemoteDataSource {
  Future<BaseResponse<DailyRouteModel>> getDailyRoute(
   DailyRouteRequestModel dailyRouteRequestModel
  );
  Future<BaseResponse<CheckInOutStatusModel>> checkInOutStatus(String dailyRouteId);
  Future<BaseResponse<List>> checkIn(CheckInRequestModel checkInRequestModel);
  Future<BaseResponse<List>> checkOut(CheckInRequestModel checkInRequestModel);


  
}

class DailyRouteRemoteDataSourceImpl extends DailyRouteRemoteDataSource {
  final RouteApiService apiServices;

  DailyRouteRemoteDataSourceImpl(this.apiServices);
  @override
 Future<BaseResponse<List>> checkIn(CheckInRequestModel checkInRequestModel) async{
    return apiServices.checkIn(checkInRequestModel);
  }

 @override
 Future<BaseResponse<List>> checkOut(CheckInRequestModel checkInRequestModel) async{
    return apiServices.checkIn(checkInRequestModel);
  }


  @override
  Future<BaseResponse<DailyRouteModel>> getDailyRoute(
   DailyRouteRequestModel dailyRouteRequestModel
  ) {
    return apiServices.getDailyRoute(dailyRouteRequestModel);
  }
  @override
  Future<BaseResponse<CheckInOutStatusModel>> checkInOutStatus( String dailyRouteId) async{
    return apiServices.checkedInOutStatus( dailyRouteId);
  }
}
