import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginModel loginModel = const LoginModel("", "");

  LoginBloc() : super(const LoginInitial()) {
    on<LoginEvent>(_onInitial);
    on<LoginSuccessEvent>(_onSuccess);
    on<LoginLoadingEvent>(_onLoading);
    on<LoginFailedEvent>(_onFailed);
  }
  _onInitial(LoginEvent event, Emitter<LoginState> emit) {
    emit(const LoginInitial());
  }
  _onLoading(LoginLoadingEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState(loginModel));
  }
  _onSuccess(LoginSuccessEvent event, Emitter<LoginState> emit) {
    emit(LoginSuccessState(loginModel));
  }
  _onFailed(LoginFailedEvent event, Emitter<LoginState> emit) {
    emit(LoginFailedState(loginModel));
  }

  Future<bool> login(String login, String password) {
    loginModel = LoginModel(login, password);
    add(LoginLoadingEvent());

    // имитация логина
    return Future.delayed(const Duration(seconds: 2), () {
      bool isLogged = Random().nextBool();
      add(isLogged ? LoginSuccessEvent() : LoginFailedEvent());
      return isLogged;
    });
  }
}
