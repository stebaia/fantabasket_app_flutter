import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';

import 'package:retrofit/http.dart';
part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('auth/login')
  Future<UserDTO> login(@Body() LoginRequest request);

  @POST('user/selfcreate')
  Future<RegistrationResponse> registration(
      @Body() RegistrationRequest request);
}
