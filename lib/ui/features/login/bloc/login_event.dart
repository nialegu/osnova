part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginLoadingEvent extends LoginEvent {
  final String login;
  final String password;

  LoginLoadingEvent({required this.login, required this.password});
}

class LoginSuccessEvent extends LoginEvent {
  final String login;
  final String password;

  LoginSuccessEvent({required this.login, required this.password});
}

class LoginFailedEvent extends LoginEvent {
  final String login;
  final String password;

  LoginFailedEvent({required this.login, required this.password});
}
