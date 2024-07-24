import 'package:flutter/material.dart';
import 'package:gemini_app/commons/constants.dart';
import 'package:gemini_app/commons/providers/gemini_chat_session_state.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/widgets/chatBubble/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({super.key});

  @override
  State<ChatHistoryView> createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  late TextEditingController textFieldController;
  late ApplicationLogger logger;

  @override
  void initState() {
    textFieldController = TextEditingController();
    logger = ApplicationLogger();
    super.initState();
  }

  @override
  void dispose() async {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    await logger.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GeminiChatSessionState geminiChatSessionState =
        context.watch<GeminiChatSessionState>();

    /// Send message to Gemini and add the message to the conversation history
    void sendMessage() async {
      String message = textFieldController.text;
      textFieldController.clear();
      geminiChatSessionState.addToChatHistory(message, UserRole.user);
      await geminiChatSessionState.sendMessageToGemini(message);
    }

    return Column(
      children: [
        Expanded(
          // SingleChildScrollView cannot be a child of Column
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: geminiChatSessionState.chatHistory.map((entry) {
                return ChatBubble(
                  message: entry.$1,
                  userRole: entry.$2,
                );
              }).toList(),
            ),
          ),
        ),
        TextField(
          controller: textFieldController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter a message...',
            suffixIcon: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
