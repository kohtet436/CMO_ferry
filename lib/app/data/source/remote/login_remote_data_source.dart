import '../../models/response_models/base_response.dart';
import '../../models/response_models/login_model.dart';
import '../../remote/ems_api_service.dart';

abstract class LogInRemoteDataSource{
  Future<BaseResponse<LogInModel>> logIn(String employeeNumber,String password);
}
class LogInRemoteDataSourceImpl extends LogInRemoteDataSource{

  final EmsApiService apiService;

  LogInRemoteDataSourceImpl({required this.apiService});

  @override
  Future<BaseResponse<LogInModel>> logIn(String employeeNumber, String password) {
    return apiService.logIn(employeeNumber, password);
  }

}