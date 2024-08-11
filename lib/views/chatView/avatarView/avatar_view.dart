import 'dart:ffi';

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
  late String _message = "";
  bool isListening = false;

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
      await microphone.startListening(hasPermission, updateMessage);
      setState(() {
        isListening = true;
      });
    }
  }

  void updateMessage(message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    final (_, height) = getScreenDimensionsForSafeArea(context, false);
    GeminiChatSessionState geminiChatSessionState =
        context.watch<GeminiChatSessionState>();

    void sendMessage(String message) async {
      geminiChatSessionState.addToChatHistory(message, UserRole.user);
      await geminiChatSessionState.sendMessageToGemini(message);
    }

    void stopListening(LongPressEndDetails details) async {
      await microphone.stopListening();
      setState(() {
        isListening = false;
      });
      microphone.getInput(sendMessage);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onLongPress: getVoiceInput,
            onLongPressEnd: stopListening,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 198, 222, 242),
              ),
              child: SizedBox(
                height: height * 0.5,
                child: Padding(
                  padding: EdgeInsets.only(left: isListening ? 25.0 : 50.0),
                  child: Image.asset(
                    isListening
                        ? "lib/assets/images/listening-pig.gif"
                        : "lib/assets/images/naughty-pig.gif",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(_message),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(geminiChatSessionState.chatHistory.isEmpty
                ? "Long Press on the Avatar to speak."
                : geminiChatSessionState.chatHistory.last.$1),
          ),
        ],
      ),
    );
  }
}
