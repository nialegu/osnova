class LoginModel {
  final String _login;
  final String _password;

  const LoginModel(
    this._login,
    this._password,
  );

  String get login => _login;
  String get password => _password;
}
