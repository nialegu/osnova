import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        minimum: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
