import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final MainAxisAlignment direction;

  const ChatBubble({super.key, required this.message, required this.direction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: direction,
      children: [
        Flexible(
            flex: 1,
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(95, 175, 174, 174)),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
