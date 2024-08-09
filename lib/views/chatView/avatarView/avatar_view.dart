import 'package:flutter/material.dart';
import 'package:gemini_app/commons/constants.dart';
import 'package:gemini_app/commons/providers/gemini_chat_session_state.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/services/permissions/microphone.dart';
import 'package:gemini_app/utils/screen_dimensions.dart';
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
    final (_, height) = getScreenDimensionsForSafeArea(context, false);
    GeminiChatSessionState geminiChatSessionState =
        context.watch<GeminiChatSessionState>();

    void stopListening(LongPressEndDetails details) async {
      String message = microphone.getInput();
      geminiChatSessionState.addToChatHistory(message, UserRole.user);
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
            child: SizedBox(
              height: height * 0.5,
              child: Image.asset(
                "lib/assets/images/naughty-pig.gif",
              ),
            ),
          ),
        ),
        Text(geminiChatSessionState.chatHistory.last.$1),
      ],
    );
  }
}
