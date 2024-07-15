import 'package:flutter/material.dart';
import 'package:gemini_app/widgets/chatBubble/chat_bubble.dart';
import 'package:logger/logger.dart';

class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({super.key});

  @override
  State<ChatHistoryView> createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  final textFieldController = TextEditingController();
  Logger logger = Logger();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }

  void sendMessage() {
    logger.i(textFieldController.text);
  }

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView cannot be a child of Column
    return Column(
      children: [
        const Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.end,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.start,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.end,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.start,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.end,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.start,
                    ),
                    ChatBubble(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      direction: MainAxisAlignment.end,
                    ),
                  ],
                ))),
        TextField(
          controller: textFieldController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a message...',
              suffixIcon: IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.arrow_forward))),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
