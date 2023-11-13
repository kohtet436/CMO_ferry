import 'package:cmo_ferry/app/data/models/request_models/employee_profile_update_request.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';

import '../../models/response_models/base_response.dart';
import '../../models/response_models/employee.dart';

abstract class EmployeeRemoteDataSource {
  Future<BaseResponse<Employee>> getEmployeeProfile();
  Future<BaseResponse<Employee>> updateEmployeeProfile(
      EmployeeProfileUpdateRequest employeeProfileUpdate);
}

class EmployeeRemoteDataSourceImpl extends EmployeeRemoteDataSource {
  final EmsApiService apiServices;

  EmployeeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<BaseResponse<Employee>> getEmployeeProfile() {
    return apiServices.getEmployeeProfile();
  }

  @override
  Future<BaseResponse<Employee>> updateEmployeeProfile(
      EmployeeProfileUpdateRequest employeeProfileUpdate) {
    return apiServices.updateEmployeeProfile(employeeProfileUpdate);
  }
}
