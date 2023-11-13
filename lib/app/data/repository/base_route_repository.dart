import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../models/response_models/base_routes_model.dart';
import '../models/response_models/response_error.dart';
import '../source/remote/base_route_remote_data_source.dart';

abstract class BaseRouteRepository {
  Future<Either<BaseRouteModel, ResponseError>> getBaseRouteData(String baserouteId);
}

class BaseRouteRepositoryImpl extends BaseRouteRepository {
  final BaseRouteRemoteDataSource remoteDataSource;

  BaseRouteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<BaseRouteModel, ResponseError>>
      getBaseRouteData(String baserouteId) async {
    var response = await remoteDataSource.getBaseRoute(baserouteId);
    var data = ResponseHandler().checkResponse(response);
    return data.fold((data){return Left(data[0]);}, (error) {return Right(error);});
  }
}