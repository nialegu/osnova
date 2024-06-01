import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
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
    emit(LoginLoadingState(LoginModel(event.login, event.password)));
  }

  _onSuccess(LoginSuccessEvent event, Emitter<LoginState> emit) {
    emit(LoginSuccessState(LoginModel(event.login, event.password)));
  }

  _onFailed(LoginFailedEvent event, Emitter<LoginState> emit) {
    emit(LoginFailedState(LoginModel(event.login, event.password)));
  }

  Future<bool> login(String login, String password) {
    add(LoginLoadingEvent(login: login, password: password));

    // имитация логина
    return Future.delayed(const Duration(seconds: 2), () {
      bool isLogged = Random().nextBool();
      add(isLogged
          ? LoginSuccessEvent(login: login, password: password)
          : LoginFailedEvent(login: login, password: password));
      return isLogged;
    });
  }
}
