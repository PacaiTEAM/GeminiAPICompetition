import 'package:flutter/material.dart';

class Avatarview extends StatelessWidget {
  const Avatarview({super.key});

  void getVoiceInput() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              getVoiceInput();
            },
            icon: Image.asset("lib/assets/images/dancing-pig.gif"))
      ],
    );
  }
}
