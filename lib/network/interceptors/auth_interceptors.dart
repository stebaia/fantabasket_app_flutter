import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/repositories/user_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final UserRepository repository;

  AuthInterceptor({
    required this.repository,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final user = await repository.currentUser;

    if (user != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${user.token}';
    }
    super.onRequest(options, handler);
  }
}
