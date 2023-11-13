import 'package:cmo_ferry/app/core/helper/helper.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/app_prefs.dart';
import '../../core/helper/di.dart';
import '../../core/helper/response_handler.dart';
import '../models/response_models/login_model.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/login_remote_data_source.dart';

abstract class LogInRepository{
  Future<Either<LogInModel,ResponseError>> logIn(String employeeNumber,String password);
}
class LogInRepositoryImpl extends LogInRepository{
  final LogInRemoteDataSource remoteDataSource;

  LogInRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<LogInModel, ResponseError>> logIn(String employeeNumber, String password) async{
    final response = await remoteDataSource.logIn(employeeNumber,password);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      final LogInModel logInResponse = data[0] as LogInModel;
      return Left(data[0]);
    }, (error) {
      return Right(error);
    });
  }

}
