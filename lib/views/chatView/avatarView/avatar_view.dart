import 'package:flutter/material.dart';
import 'package:gemini_app/commons/providers/gemini_chat_session_state.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/services/permissions/microphone.dart';
import 'package:provider/provider.dart';

class AvatarView extends StatefulWidget {
  final Microphone microphone;

  const AvatarView({super.key, required this.microphone});

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  late final Microphone microphone;
  late ApplicationLogger logger;

  @override
  void initState() {
    super.initState();
    microphone = widget.microphone;
    logger = ApplicationLogger();
    _initializeMicrophonePermission();
  }

  @override
  void dispose() async {
    await microphone.stopListening();
    super.dispose();
  }

  Future<void> _initializeMicrophonePermission() async {
    if (!(await microphone.hasPermission())) {
      if (await microphone.getPermission()) {
        logger.i('Microphone permission granted.');
      } else {
        logger.i('Microphone permission denied.');
      }
    }
  }

  void getVoiceInput() async {
    bool hasPermission = await microphone.hasPermission();
    if (hasPermission && await microphone.initialize()) {
      logger.i("Speech recognition has been successfully initialized.");
      await microphone.startListening(hasPermission);
    }
  }

  @override
  Widget build(BuildContext context) {
    GeminiChatSessionState geminiChatSessionState =
        context.watch<GeminiChatSessionState>();

    void stopListening(LongPressEndDetails details) async {
      String message = microphone.getInput();
      await geminiChatSessionState.sendMessageToGemini(message);
      await microphone.stopListening();
    }

    return Column(
      children: [
        GestureDetector(
          // onTap: getVoiceInput,
          onLongPress: getVoiceInput,
          onLongPressEnd: stopListening,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Image.asset(
              "lib/assets/images/dancing-pig.gif",
            ),
          ),
        ),
        Text(geminiChatSessionState.chatHistory.last.$1),
      ],
    );
  }
}
