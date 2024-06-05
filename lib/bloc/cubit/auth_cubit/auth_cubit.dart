import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository userRepository;
  final BuildContext context;
  AuthCubit({required this.userRepository, required this.context})
      : super(const CheckAuthenticationState());

  void checkAuthenticationState() async {
    try {
      final user = await userRepository.currentUser;
      if (user != null) {
        if (user.userId > 0) {
          emit(AuthenticatedState(user));
        } else {
          emit(CheckAuthenticationState());
        }
      } else {
        emit(const NotAuthenticatedState());
      }
    } catch (ex) {
      emit(const NotAuthenticatedState());
    }
  }



  Future<bool> check() async {
    try {
      final user = await userRepository.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      return false;
    }
  }

  void authenticated(User user) => emit(AuthenticatedState(user));

  

  void manualLogout() async {
    await userRepository.logout();
    emit(const NotAuthenticatedState());
  }

  /*void singOut(bool force) async {
    final user = await userRepository.logout(force, context);
    if (!force) {
      checkAuthenticationState();
    } else {
      emit(const NotAuthenticatedState());
    }
  }*/
}
