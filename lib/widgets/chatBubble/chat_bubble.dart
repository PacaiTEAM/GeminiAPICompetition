import 'package:flutter/material.dart';
import 'package:gemini_app/commons/constants.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final UserRole userRole;

  const ChatBubble({super.key, required this.message, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: userRole == UserRole.gemini
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Flexible(
            flex: 1,
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(95, 175, 174, 174),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(8),
                child: Text(message),
              ),
            )),
      ],
    );
  }
}
