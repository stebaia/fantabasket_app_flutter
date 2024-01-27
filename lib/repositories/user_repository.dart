import 'dart:convert';

import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/responses/login_response.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/network/user_service/user_service.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:fantabasket_app_flutter/utils/date_converter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pine/utils/mapper.dart';

class UserRepository {
  final UserService userService;
  final Mapper<User, String> userMapper;
  final DTOMapper<UserDTO, User> userDTOMapper;
  final FlutterSecureStorage flutterSecureStorage;
  final Logger logger;

  UserRepository({
    required this.flutterSecureStorage,
    required this.logger,
    required this.userDTOMapper,
    required this.userMapper,
    required this.userService,
  });

  Future<RegistrationResponse> registration({
    required String email,
    required String password,
    required String name,
    required String surname,
  }) async {
    try {
      RegistrationRequest request = RegistrationRequest(
          email: email,
          password: md5.convert(utf8.encode(password)).toString(),
          surname: surname,
          name: name);

      final response = await userService.registration(request);

      return response;
    } catch (error, stackTrace) {
      logger.e('Error signing in with email $email',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      LoginResponse response = await userService.login(LoginRequest(
          email: email,
          password: md5.convert(utf8.encode(password)).toString(),
          timestamp: DateConverter.getDateNowWithFormat()));

      User user = User(
          userId: 0,
          firstName: '',
          email: email,
          lastName: '',
          token: response.token!,
          tokenExpiration: '');
      await flutterSecureStorage.write(
          key: Constants.userKey, value: userMapper.from(user));
      user = await takeUser(
          email: email, password: password, loginResponse: response);
      return user;
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $email',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<User> takeUser(
      {required String email,
      required String password,
      required LoginResponse loginResponse}) async {
    final response = await userService.takeToken(LoginRequest(
        email: email,
        password: md5.convert(utf8.encode(password)).toString(),
        timestamp: DateConverter.getDateNowWithFormat()));
    User user = userDTOMapper.fromDTO(response);
    user.token = loginResponse.token!;
    await flutterSecureStorage.write(
        key: Constants.userKey, value: userMapper.from(user));
    return user;
  }

  /*Future<User> fakeLogin({
    required String email,
    required String password,
  }) async {
    try {
      User user;
      if (email == 'test@test.it') {
        user = User(
            id: 1,
            name: "rental",
            surname: "rental",
            email: email,
            birth: "01/12/1990",
            registrationDate: "13/11/2023",
            lastLogin: "13/11/2023",
            isCharterer: true);
      } else {
        user = User(
            id: 1,
            name: "ProvaName",
            surname: "ProvaSurname",
            email: email,
            birth: "01-12-1990",
            registrationDate: "13/11/2023",
            lastLogin: "13/11/2023",
            isCharterer: false);
      }
      await flutterSecureStorage.write(
          key: Constants.userKey, value: userMapper.from(user));
      return user;
    } catch (e) {
      logger.e(
        'Error sing in with email $email',
        error: e,
      );
      rethrow;
    }
  }
*/
  Future<void> logout() async {
    await flutterSecureStorage.delete(
      key: Constants.userKey,
    );
  }

  Future<User?> get currentUser async {
    final json = await flutterSecureStorage.read(key: Constants.userKey);
    if (json != null) {
      return userMapper.to(json);
    }
    return null;
  }
}
