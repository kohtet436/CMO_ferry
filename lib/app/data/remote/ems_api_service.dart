import 'package:cmo_ferry/app/data/models/request_models/employee_profile_update_request.dart';
import 'package:cmo_ferry/app/data/models/request_models/ferry_request.dart';
import 'package:cmo_ferry/app/data/models/response_models/employee.dart';
import 'package:cmo_ferry/app/data/models/response_models/ferry_request_response.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/request_models/change_password_request_model.dart';
import '../models/request_models/employee_profile_update_request.dart';
import '../models/request_models/leave_request_model.dart';
import '../models/request_models/log_in_request_model.dart';
import '../models/response_models/base_response.dart';
import '../models/response_models/base_routes_model.dart';
import '../models/response_models/ferry_stop.dart';

import '../models/response_models/ferry_stop.dart' as ferry_stop;
import '../models/response_models/leave_history_model.dart';
import '../models/response_models/login_model.dart';

part 'ems_api_service.g.dart';

@RestApi()
abstract class EmsApiService {
  factory EmsApiService(Dio dio) = _EmsApiService;

  @GET("/driver/base-route/1")
  Future<BaseResponse<BaseRouteModel>> getBaseRoute();

  @POST('/api/Employees/Login')
  Future<BaseResponse<LogInModel>> logIn(
    @Field("username") employeeNumber,
    @Field("password") password,
  );

  @GET('/api/Employees/GetEmployeeProfile')
  Future<BaseResponse<Employee>> getEmployeeProfile();

  @PUT('/api/Employees/UpdateEmployeeByMobile')
  Future<BaseResponse<Employee>> updateEmployeeProfile(
    @Body() EmployeeProfileUpdateRequest employeeProfileUpdate,
  );

  @GET('/api/Township/GetAllTownships')
  Future<BaseResponse<ferry_stop.Township>> getAllTownships();

  @GET('/api/Road/GetAllRoads')
  Future<BaseResponse<ferry_stop.Road>> getAllRoads();

  @GET('/api/FerryStop/GetAllFerryStops')
  Future<BaseResponse<ferry_stop.FerryStop>> getAllFerryStops(@Query('roadId') String roadId, @Query('townshipId') String townshipId);

  @POST('/api/FerryRequests/AddFerryRequest')
  Future<BaseResponse<FerryRequestResponse>> requestFerry(@Body() FerryRequest ferryRequest);

  @POST('/api/EmployeeLeave/AddEmployeeLeave')
  Future<BaseResponse<List>> requestFerryLeave(@Body() LeaveRequestModel leaveRequestModel);

  @GET('/api/EmployeeLeave/GetEmployeeLeave')
  Future<BaseResponse<LeaveHistoryModel>> leaveHistory();

  @PUT('/api/Employees/ChangePassword')
  Future<BaseResponse<List>> changePassword(
    @Body() ChangePasswordRequestModel changePasswordRequestModel,
  );
}
