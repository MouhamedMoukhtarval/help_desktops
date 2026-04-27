
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/login/data/models/login_request_body.dart';
import 'package:help_desktops/features/login/data/models/login_response.dart';
import 'package:help_desktops/features/login/data/services/api_services.dart';
class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try{
      final response = await _apiServices.loginUser(loginRequestBody);
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}