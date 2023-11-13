
import 'package:cmo_ferry/app/data/models/request_models/leave_request_model.dart';

import '../../models/response_models/base_response.dart';
import '../../remote/ems_api_service.dart';

abstract class FerryLeaveRemoteDataSource{
  Future<BaseResponse<List>> requestFerryLeave(LeaveRequestModel leaveRequestModel);
}

class FerryLeaveRemoteDataSourceImpl extends FerryLeaveRemoteDataSource{
  final EmsApiService apiServices;

  FerryLeaveRemoteDataSourceImpl(this.apiServices);
  @override
  Future<BaseResponse<List>> requestFerryLeave(LeaveRequestModel leaveRequestModel) {
    return apiServices.requestFerryLeave(leaveRequestModel);
  }

}