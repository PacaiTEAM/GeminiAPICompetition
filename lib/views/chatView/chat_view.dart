import 'package:flutter/material.dart';
import 'package:gemini_app/views/chatView/avatarView/avatar_view.dart';
import 'package:gemini_app/views/chatView/chatHistoryView/chat_history_view.dart';
import 'package:gemini_app/services/permissions/microphone.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  Widget view = AvatarView(microphone: Microphone());
  bool isChatHistoryView = false;

  void changeView(newView) {
    setState(() {
      isChatHistoryView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    view = isChatHistoryView
        ? const ChatHistoryView()
        : AvatarView(microphone: Microphone());

    return Flexible(
        fit: FlexFit.tight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.end,
              direction: Axis.horizontal,
              children: [
                Switch(value: isChatHistoryView, onChanged: changeView)
              ],
            ),
            Flexible(
              fit: FlexFit.tight,
              child: view,
            ),
          ],
        ));
  }
}
