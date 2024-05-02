import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/core/widgets/string_input_field.dart';

import '../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              ),
              StringInputField(
                hintText: S.of(context).enterPassword,
                labelText: S.of(context).password,
              ),
              ElevatedButton(
                onPressed: () => context.go("/home"),
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  S.of(context).login,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
