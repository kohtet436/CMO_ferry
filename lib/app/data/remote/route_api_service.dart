import 'package:cmo_ferry/app/data/models/request_models/checkIn_request_model.dart';
import 'package:cmo_ferry/app/data/models/response_models/dialy_route_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/request_models/daily_route_request_model.dart';
import '../models/response_models/base_response.dart';
import '../models/response_models/base_route_id_model.dart';
import '../models/response_models/base_routes_model.dart';
import '../models/response_models/check_in_out_status_model.dart';

part 'route_api_service.g.dart';

@RestApi()
abstract class RouteApiService {
  factory RouteApiService(
    Dio dio,
  ) = _RouteApiService;

  @GET('/api/BaseRoute/GetBaseRouteById/{baserouteId}')
  Future<BaseResponse<BaseRouteModel>> getBaseRoute(@Path('baserouteId') String baserouteId);

  @POST('/api/DailyRoute/GetDailyRouteByDateTimeAndRoute')
  Future<BaseResponse<DailyRouteModel>> getDailyRoute(
    @Body() DailyRouteRequestModel dailyRouteRequest,
  );

  @GET('/api/BaseRoute/GetBaseRouteId')
  Future<BaseResponse<BaseRouteIdModel>> getBaseRouteId();

  @POST('/api/DailyRoute/GetCheckInStatus')
  Future<BaseResponse<CheckInOutStatusModel>> checkedInOutStatus(@Field("dailyRouteId") dailyRouteId);

  @POST('/api/DailyRoute/CheckInCheckOut')
  Future<BaseResponse<List>> checkIn(
    @Body() CheckInRequestModel checkInRequestModel,
  );

//  @GET("api/BaseRoute/GetBaseRouteId")
//  @Headers({'Authentication':'Bearer ${getStorage.read('jwtToken')}' })

// Future<BaseResponse<List>>getBaseRouteId() ;
// TODO: implement getBaseRouteI

// @POST('employee/ferryLeave')
// Future<BaseResponse<List>> ferryLeave(
//     @Field("employeeId") employeeId,
//     @Field("reason") reason,
//     @Field("date") date,
//     @Field("routeType") routeType);
// 46d2e869-df59-4b0b-aeb2-c1d27ef43d07')
}
