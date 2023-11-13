import 'package:cmo_ferry/app/data/models/request_models/change_password_request_model.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';

import '../../models/request_models/leave_request_model.dart';
import '../../models/response_models/base_response.dart';

abstract class ChangePasswordRemoteDataSource{
  Future<BaseResponse<List>> changePassword(ChangePasswordRequestModel changePasswordRequestModel);
}

class ChangePasswordRemoteDataSourceImpl extends ChangePasswordRemoteDataSource{
  final EmsApiService apiServices;

  ChangePasswordRemoteDataSourceImpl(this.apiServices);
  @override
  Future<BaseResponse<List>> changePassword(ChangePasswordRequestModel changePasswordRequestModel) {
    return apiServices.changePassword(changePasswordRequestModel);
  }

}