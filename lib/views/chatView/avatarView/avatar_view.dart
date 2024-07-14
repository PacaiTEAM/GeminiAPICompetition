import 'package:flutter/material.dart';
import 'package:gemini_app/services/permissions/microphone.dart';

class AvatarView extends StatefulWidget {
  final Microphone microphone;

  const AvatarView({super.key, required this.microphone});

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  late final Microphone microphone;

  @override
  void initState() {
    super.initState();
    microphone = widget.microphone;
  }

  void getVoiceInput() async {
    bool hasPermission = await microphone.hasPermission();
    if (!hasPermission) {
      hasPermission = await microphone.getPermission();
    }
    microphone.getInput(hasPermission);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: getVoiceInput,
        icon: Image.asset("lib/assets/images/dancing-pig.gif"));
  }
}
