import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/core/widgets/string_input_field.dart';

import '../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), //
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: Form(
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
              ElevatedButton(
                onPressed: () => context.go("/home"),
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  S.of(context).login,
                ),
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
  }
}
