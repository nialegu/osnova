import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';
import 'widgets/animated_login_progress_icon.dart';
import '../../core/widgets/platform_addicted/alert_dialog.dart';
import '../../core/widgets/string_input_field.dart';
import '../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final loginBloc = BlocProvider.of<LoginBloc>(context);
          _loginController.text = state.loginModel.login;
          _passwordController.text = state.loginModel.password;

          return Scaffold(
            appBar: AppBar(), //
            body: SafeArea(
              minimum: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
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
                    !state.isProcessing && !state.isSuccess
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                await loginBloc
                                    .login(_loginController.text,
                                        _passwordController.text)
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
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(S.of(context).login),
                          )
                        : const AnimatedLoginProgressIcon(),
                    InkWell(
                      child: Text(S.of(context).signUp),
                      onTap: () => context.go("/signup"),
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
          );
        },
      ),
    );
  }
}
