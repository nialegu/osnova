part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupReset extends SignupEvent {}

class SignupAttempt extends SignupEvent {}