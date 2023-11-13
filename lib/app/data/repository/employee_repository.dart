import 'package:cmo_ferry/app/data/models/request_models/employee_profile_update_request.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/base_response.dart';
import '../models/response_models/employee.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/employee_remote_data_source.dart';

abstract class EmployeeRepository {
  Future<Either<Employee, ResponseError>> getEmployeeProfileData();
  Future<Either<Employee, ResponseError>> updateEmployeeProfile(
    String phoneNumber,
    String address,
  );
}

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Employee, ResponseError>> getEmployeeProfileData() async {
    BaseResponse<Employee> response =
        await remoteDataSource.getEmployeeProfile();
    var data = ResponseHandler().checkResponse(response);
    return data.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<Employee, ResponseError>> updateEmployeeProfile(
    String phoneNumber,
    String address,
  ) async {
    EmployeeProfileUpdateRequest employeeProfileUpdate = EmployeeProfileUpdateRequest(phoneNumber: phoneNumber, address: address);
    BaseResponse<Employee> response = await remoteDataSource.updateEmployeeProfile(employeeProfileUpdate);
    var data = ResponseHandler().checkResponse(response);
    return data.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }
}
