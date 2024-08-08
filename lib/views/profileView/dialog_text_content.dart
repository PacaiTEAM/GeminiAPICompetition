import 'package:flutter/material.dart';

class DialogTextContent extends StatefulWidget {
  final String field;

  @override
  State<DialogTextContent> createState() => _DialogTextContentState();
}

class _DialogTextContentState extends State<DialogTextContent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter new $field",
        hintStyle: const TextStyle(color: Colors.grey),
        errorText: error,
      ),
      onChanged: (value) {
        newValue = value;

        setState(() => error = getErrorText(value));
      },
    );
  }
}
