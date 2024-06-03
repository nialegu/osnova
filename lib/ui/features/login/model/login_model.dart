class LoginModel {
  final String _login;
  final String _password;

  const LoginModel({String login = '', String password = ''})
      : _login = login,
        _password = password;

  String get login => _login;
  String get password => _password;
}
