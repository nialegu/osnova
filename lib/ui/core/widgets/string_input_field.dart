import 'package:flutter/material.dart';

class StringInputField extends StatelessWidget {
  StringInputField({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: _textController,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(),
    );
  }
}