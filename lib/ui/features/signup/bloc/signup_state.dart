part of 'signup_bloc.dart';

@immutable
sealed class SignupState {
  final SignUpModel signUpModel;

  const SignupState({required this.signUpModel});

}

final class SignupInitial extends SignupState {
  const SignupInitial({required super.signUpModel});
}

final class SignupLoadingState extends SignupState {
  const SignupLoadingState({required super.signUpModel});
}

final class SignupSuccessState extends SignupState {
  const SignupSuccessState({required super.signUpModel});
}

final class SignupFailedState extends SignupState {
  const SignupFailedState({required super.signUpModel});
}

final class SignupErrorState extends SignupState {
  const SignupErrorState({required super.signUpModel});
}
