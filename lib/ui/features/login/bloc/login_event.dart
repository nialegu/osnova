part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginFailedEvent extends LoginEvent {}
