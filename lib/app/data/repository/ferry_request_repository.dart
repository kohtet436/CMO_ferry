import 'package:cmo_ferry/app/core/helper/app_enum.dart';
import 'package:cmo_ferry/app/core/helper/response_handler.dart';
import 'package:cmo_ferry/app/data/models/request_models/ferry_request.dart';
import 'package:cmo_ferry/app/data/models/response_models/ferry_request_response.dart';
import 'package:cmo_ferry/app/data/models/response_models/ferry_stop.dart';
import 'package:cmo_ferry/app/data/models/response_models/response_error.dart';
import 'package:cmo_ferry/app/data/source/remote/ferry_request_remote_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class FerryRequestRepository {
  Future<Either<List<Township>, ResponseError>> getAllTownships();

  Future<Either<List<Road>, ResponseError>> getAllRoads();

  Future<Either<List<FerryStop>, ResponseError>> getAllFerryStops(
      String roadId, String townshipId);

  Future<Either<FerryRequestResponse, ResponseError>> sendFerryRequest(
    String ferryStopId,
    FerryRequestType requestType,
    DateTime requestDate,
 );
}

class FerryRequestRepositoryImpl extends FerryRequestRepository {
  final FerryRequestRemoteDataSource remoteDataSource;

  FerryRequestRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<List<FerryStop>, ResponseError>> getAllFerryStops(
    String roadId,
    String townshipId,
  ) async {
    final response =
        await remoteDataSource.getAllFerryStops(roadId, townshipId);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<List<Road>, ResponseError>> getAllRoads() async {
    final response = await remoteDataSource.getAllRoads();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<List<Township>, ResponseError>> getAllTownships() async {
    final response = await remoteDataSource.getAllTownships();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<FerryRequestResponse, ResponseError>> sendFerryRequest(
     String ferryStopId,
     FerryRequestType requestType,
     DateTime requestDate,
  ) async {
    FerryRequest ferryRequest = FerryRequest(
      requestType: requestType,
      ferryStopId: ferryStopId,
      requestDate: requestDate,
    );
    final response = await remoteDataSource.sendFerryRequest(ferryRequest);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }
}
