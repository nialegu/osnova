part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  final LoginModel loginModel;
  final bool isSuccess;
  final bool isProcessing;

  const LoginState({
    required this.loginModel,
    required this.isSuccess,
    required this.isProcessing,
  });
}

final class LoginInitial extends LoginState {
  const LoginInitial()
      : super(
            loginModel: const LoginModel("", ""),
            isSuccess: false,
            isProcessing: false);
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState(LoginModel loginModel)
      : super(loginModel: loginModel, isSuccess: false, isProcessing: true);
}

final class LoginSuccessState extends LoginState {
  const LoginSuccessState(LoginModel loginModel)
      : super(loginModel: loginModel, isSuccess: true, isProcessing: false);
}

final class LoginFailedState extends LoginState {
  const LoginFailedState(LoginModel loginModel)
      : super(loginModel: loginModel, isSuccess: false, isProcessing: false);
}
