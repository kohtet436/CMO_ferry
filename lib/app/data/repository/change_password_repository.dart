import 'package:cmo_ferry/app/data/models/request_models/change_password_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/chang_password_remote_data_source.dart';

abstract class ChangePasswordRepository{
  Future<Either<String ,ResponseError>>changePassword(ChangePasswordRequestModel changePasswordRequestModel);
}
class ChangePasswordRepositoryImpl extends ChangePasswordRepository{
  final ChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<String, ResponseError>> changePassword(ChangePasswordRequestModel changePasswordRequestModel) async{
    final response = await remoteDataSource.changePassword(changePasswordRequestModel);
    final responseHandlerData = ResponseHandler().checkResponse(response, containMessage: true,);
    return responseHandlerData.fold((data) {
      return Left(data['message']);
    }, (error) {
      return Right(error);
    });
  }

}