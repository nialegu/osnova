import 'package:flutter/material.dart';

class StringInputField extends StatelessWidget {
  StringInputField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.initialValue});

  final String hintText;
  final String labelText;

  final String? initialValue;

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textController.text = initialValue ?? "";
    return TextFormField(
      controller: _textController,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
