import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class ErrorText {
  static String? getErrorText(TextEditingController _controller) {
    final text = _controller.value.text;
    if (text.isEmpty) return 'Please enter a name';
    if (text.length < 3) return 'Name must be at least 3 characters long';
    if (text.length > 15) return 'Name must be at most 15 characters long';
    return null;
  }
}
