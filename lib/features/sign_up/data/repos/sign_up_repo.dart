
import 'package:help_desktops/core/networking/api_error_handler.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/features/login/data/services/api_services.dart';
import 'package:help_desktops/features/sign_up/data/models/sgin_up_request_body.dart';
import 'package:help_desktops/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiServices _apiServices;

  SignUpRepo(this._apiServices);

  Future<ApiResult<SignUpResponseBody>> signUp(SignUpRequestBody signUpRequestBody) async {
    try{
      final response = await _apiServices.signUpUser(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

}