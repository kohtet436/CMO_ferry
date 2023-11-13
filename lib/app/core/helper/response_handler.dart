import 'package:dartz/dartz.dart';

import '../../data/models/response_models/base_response.dart';
import '../../data/models/response_models/response_error.dart';

class ResponseHandler {
  Either<dynamic, ResponseError> checkResponse(BaseResponse response,
      {bool containMessage = false}) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      if (containMessage) {
        return Left(
          {
            "message": response.message,
            "data": response.data,
          },
        );
      } else {
        return Left(
          response.data,
        );
      }
    } else {
      return Right(
        ResponseError(
            statusCode: response.statusCode, message: response.message),
      );
    }
  }
}
