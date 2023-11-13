import 'package:cmo_ferry/app/data/models/request_models/leave_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/ferry_leave_remote_data_source.dart';

abstract class FerryLeaveRepository{
  Future<Either<String ,ResponseError>>requestFerryLeave(LeaveRequestModel leaveRequestModel);
}
class FerryLeaveRepositoryImpl extends FerryLeaveRepository{
  final FerryLeaveRemoteDataSource remoteDataSource;

  FerryLeaveRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<String, ResponseError>> requestFerryLeave(LeaveRequestModel leaveRequestModel) async{
    final response = await remoteDataSource.requestFerryLeave(leaveRequestModel);
    final responseHandlerData = ResponseHandler().checkResponse(response, containMessage: true,);
    return responseHandlerData.fold((data) {
      return Left(data['message']);
    }, (error) {
      return Right(error);
    });
  }

}