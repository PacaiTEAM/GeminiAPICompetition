import 'package:flutter/material.dart';
import 'package:gemini_app/services/permissions/microphone.dart';

class Avatarview extends StatefulWidget {
  const Avatarview({super.key});

  @override
  State<Avatarview> createState() => _AvatarviewState();
}

class _AvatarviewState extends State<Avatarview> {
  Microphone microphone = Microphone();

  void getVoiceInput() async {
    bool hasPermission = await microphone.hasPermission();
    if (!hasPermission) {
      hasPermission = await microphone.getPermission();
    }
    microphone.getInput(hasPermission);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: getVoiceInput,
            icon: Image.asset("lib/assets/images/dancing-pig.gif"))
      ],
    );
  }
}
