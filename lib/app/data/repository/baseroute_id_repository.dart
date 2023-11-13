import 'package:cmo_ferry/app/data/source/remote/baseroute_id_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/base_route_id_model.dart';
import '../models/response_models/response_error.dart';

abstract class GetBaseRouteIdRepository {
  Future<Either<BaseRouteIdModel, ResponseError>> getBaseRouteId();
}

class GetBaseRouteIdRepositoryImpl extends GetBaseRouteIdRepository {
  // final GetBaseRouteIdRemoteDataSource remoteDataSource;
  final GetBaseRouteIdRemoteDataSource remoteDataSource;

  GetBaseRouteIdRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<BaseRouteIdModel, ResponseError>> getBaseRouteId() async {
    final response = await remoteDataSource.getBaseRouteId();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
        (data) => Left(data[0]), (error) => Right(error));
  }
}
