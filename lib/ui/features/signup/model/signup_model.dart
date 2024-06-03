class SignUpModel {
  final String _login;
  final String _password;
  final String _confirmPassword;
  final String _firstName;
  final String _secondName;
  final String _phoneNumber;

  bool get isValid => _login.isNotEmpty && _password.isNotEmpty;

  bool get passwordsMatch => _password == _confirmPassword;

  const SignUpModel(
      {String login = '',
      String password = '',
      String confirmPassword = '',
      String firstName = '',
      String secondName = '',
      String phoneNumber = ''})
      : _login = login,
        _password = password,
        _confirmPassword = confirmPassword,
        _firstName = firstName,
        _secondName = secondName,
        _phoneNumber = phoneNumber;

  String get login => _login;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get firstName => _firstName;
  String get secondName => _secondName;
  String get phoneNumber => _phoneNumber;
}
