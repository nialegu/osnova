import 'package:flutter/material.dart';

class StringInputField extends StatefulWidget {
  const StringInputField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.textController,
  });

  final String hintText;
  final String labelText;
  final TextEditingController? textController;

  @override
  StateStringInputField createState() => StateStringInputField();
}

class StateStringInputField extends State<StringInputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: (value) {
        if (value == "") {
          return "Fill this field";
        } else {
          return null;
        }
      },
      style: Theme.of(context).textTheme.displayMedium,
      obscureText: isObscure,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          border: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
