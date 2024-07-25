import 'package:flutter/material.dart';
import 'package:gemini_app/utils/screen_dimensions.dart';
import "package:typewritertext/typewritertext.dart";

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final (width, _) = getScreenDimensionsForSafeArea(context, false);

    return TypeWriter.text("HelloooOink, I'm the Sarcastic Pig...",
        onFinished: null,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: width * 0.1,
          color: Colors.white,
        ),
        duration: const Duration(milliseconds: 75));
  }
}
