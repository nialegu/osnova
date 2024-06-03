import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/signup_bloc.dart';
import 'widgets/animated_login_progress_icon.dart';
import '../../core/widgets/platform_addicted/alert_dialog.dart';
import '../../core/widgets/string_input_field.dart';
import '../../../generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          final signupBloc = BlocProvider.of<SignupBloc>(context);
          _loginController.text = state.signUpModel.login;
          _passwordController.text = state.signUpModel.password;

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              minimum: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      StringInputField(
                        hintText: S.of(context).enterLogin,
                        labelText: S.of(context).login,
                        textController: _loginController,
                      ),
                      StringInputField(
                        hintText: S.of(context).enterPassword,
                        labelText: S.of(context).password,
                        textController: _passwordController,
                      ),
                      StringInputField(
                        hintText: S.of(context).confirmPassword,
                        labelText: S.of(context).confirmPassword,
                        textController: _confirmPasswordController,
                      ),
                      StringInputField(
                        hintText: S.of(context).enterFirstName,
                        labelText: S.of(context).firstName,
                        textController: _firstNameController,
                      ),
                      StringInputField(
                        hintText: S.of(context).enterSecondName,
                        labelText: S.of(context).secondName,
                        textController: _secondNameController,
                      ),
                      StringInputField(
                        hintText: S.of(context).enterPhoneNumber,
                        labelText: S.of(context).phoneNumber,
                        textController: _phoneNumberController,
                      ),
                      state is SignupLoadingState
                          ? const AnimatedLoginProgressIcon()
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  await signupBloc
                                      .signUp(
                                          login: _loginController.text,
                                          password: _passwordController.text,
                                          confirmPassword:
                                              _confirmPasswordController.text,
                                          firstName: _firstNameController.text,
                                          secondName:
                                              _secondNameController.text,
                                          phoneNumber:
                                              _phoneNumberController.text)
                                      .then((isLogged) {
                                    if (isLogged) {
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        context.go("/home");
                                      });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => alert(
                                              S
                                                  .of(context)
                                                  .incorrectEmailOrPassword,
                                              ""));
                                    }
                                  });
                                }
                              },
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(S.of(context).login),
                            )
                    ]
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: e,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
