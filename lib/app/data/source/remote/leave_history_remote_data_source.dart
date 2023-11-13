import 'package:cmo_ferry/app/data/models/response_models/leave_history_model.dart';
import 'package:cmo_ferry/app/data/remote/ems_api_service.dart';

import '../../models/response_models/base_response.dart';


abstract class LeaveHistoryRemoteDataSource{
  Future<BaseResponse<LeaveHistoryModel>> leaveHistory();
}
class LeaveHistoryRemoteDataSourceImpl extends LeaveHistoryRemoteDataSource{

final EmsApiService apiService;

  LeaveHistoryRemoteDataSourceImpl({required this.apiService});

  @override
  Future<BaseResponse<LeaveHistoryModel>> leaveHistory() {
    return apiService.leaveHistory();
  }
  

}