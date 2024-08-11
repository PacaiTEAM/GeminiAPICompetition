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
  late String Message = "";

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
    }
  }

  void updateMessage(message) {
    setState(() {
      Message = message;
    });
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
      // updateMessage(message);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            // onTap: getVoiceInput,
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
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Image.asset(
                    "lib/assets/images/naughty-pig.gif",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(Message),
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
