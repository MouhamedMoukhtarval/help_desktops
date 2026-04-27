import 'package:dio/dio.dart';
import 'package:help_desktops/core/networking/base_endpoint.dart';
import 'package:help_desktops/features/login/data/models/login_request_body.dart';
import 'package:help_desktops/features/login/data/models/login_response.dart';
import 'package:help_desktops/features/login/data/services/api_constants.dart';
import 'package:help_desktops/features/sign_up/data/models/sgin_up_request_body.dart';
import 'package:help_desktops/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: BaseEndpoint.baseUrl)
abstract class ApiServices{
  factory ApiServices(Dio dio,{String baseUrl}) = _ApiServices;
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> loginUser(
    @Body() LoginRequestBody loginRequestBody
  );
  @POST(ApiConstants.registerEndpoint)
  Future<SignUpResponseBody> signUpUser(
    @Body() SignUpRequestBody signUpRequestBody
  );
}