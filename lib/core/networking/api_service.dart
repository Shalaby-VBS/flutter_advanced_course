import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constants.dart';
import 'package:flutter_advanced/modules/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/modules/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../modules/signup/data/models/signup_request_body.dart';
import '../../modules/signup/data/models/signup_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}