import 'package:cmo_ferry/app/data/models/response_models/leave_history_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/leave_history_remote_data_source.dart';

abstract class LeaveHistoryRepository {
  Future<Either<List<LeaveHistoryModel>, ResponseError>> leaveHistory();
}

class LeaveHistoryRepositoryImpl extends LeaveHistoryRepository {
  final LeaveHistoryRemoteDataSource remoteDataSource;
  LeaveHistoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<List<LeaveHistoryModel>, ResponseError>> leaveHistory() async {
    final response = await remoteDataSource.leaveHistory();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data);
    }, (error) {
      return Right(error);
    });
  }
}
