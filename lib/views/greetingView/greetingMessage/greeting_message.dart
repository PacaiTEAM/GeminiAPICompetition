import 'package:flutter/material.dart';
import 'package:gemini_app/utils/screen_dimensions.dart';
import "package:typewritertext/typewritertext.dart";

class GreetingMessage extends StatelessWidget {
  // const GreetingMessage({super.key});
  final void Function() updateView;

  const GreetingMessage({super.key, required this.updateView});

  @override
  Widget build(BuildContext context) {
    final (width, _) = getScreenDimensionsForSafeArea(context, false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypeWriter.text("HelloooOink, I'm the Sarcastic Pig...",
            onFinished: null,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.1,
              color: Colors.white,
            ),
            duration: const Duration(milliseconds: 75)),
        const SizedBox(height: 50),
        ElevatedButton(
            onPressed: updateView, child: const Icon(Icons.arrow_forward)),
      ],
    );
  }
}
