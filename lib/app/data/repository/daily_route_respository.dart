import 'package:cmo_ferry/app/data/models/request_models/checkIn_request_model.dart';
import 'package:cmo_ferry/app/data/models/request_models/daily_route_request_model.dart';
import 'package:dartz/dartz.dart';
import '../../core/helper/response_handler.dart';
import '../models/response_models/check_in_out_status_model.dart';
import '../models/response_models/dialy_route_model.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/deaily_route_remote_data_source.dart';

abstract class DailyRouteRepository {
  Future<Either<DailyRouteModel, ResponseError>> getDailyRoute(
      DailyRouteRequestModel dailyRouteRequestModel);
  Future<Either<CheckInOutStatusModel, ResponseError>> checkInOutStatus(
      String dailyRouteId);

  Future<Either<String, ResponseError>> checkIn(
      CheckInRequestModel checkInRequestModel);
  Future<Either<String, ResponseError>> checkOut(
      CheckInRequestModel checkInRequestModel);
}

class DailyRouteRepositoryImpl extends DailyRouteRepository {
  final DailyRouteRemoteDataSource remoteDataSource;

  DailyRouteRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<String, ResponseError>> checkIn(
      CheckInRequestModel checkInRequestModel) async {
    final response = await remoteDataSource.checkIn(checkInRequestModel);
    final responseHandlerData = ResponseHandler().checkResponse(
      response,
      containMessage: true,
    );
    return responseHandlerData.fold((data) {
      return Left(data['message']);
    }, (error) {
      return Right(error);
    });
  }

  Future<Either<String, ResponseError>> checkOut(
      CheckInRequestModel checkInRequestModel) async {
    final response = await remoteDataSource.checkOut(checkInRequestModel);
    final responseHandlerData = ResponseHandler().checkResponse(
      response,
      containMessage: true,
    );
    return responseHandlerData.fold((data) {
      return Left(data['message']);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<DailyRouteModel, ResponseError>> getDailyRoute(
      DailyRouteRequestModel dailyRouteRequestModel) async {
    final response =
        await remoteDataSource.getDailyRoute(dailyRouteRequestModel);

    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<CheckInOutStatusModel, ResponseError>> checkInOutStatus(
      String dailyRouteId) async {
    final response = await remoteDataSource.checkInOutStatus(dailyRouteId);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data[0]);
    }, (error) {
      return Right(error);
    });
  }
}
