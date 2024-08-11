import 'package:flutter/material.dart';
import 'package:gemini_app/commons/providers/gemini_chat_session_state.dart';
import 'package:gemini_app/views/chatView/avatarView/avatar_view.dart';
import 'package:gemini_app/views/chatView/chatHistoryView/chat_history_view.dart';
import 'package:gemini_app/services/permissions/microphone.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  static const id = "/chatView";

  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late Widget view;
  bool isChatHistoryView = false;

  /// Switch views between ChatHistoryView and AvatarView
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flex(
          mainAxisAlignment: MainAxisAlignment.end,
          direction: Axis.horizontal,
          children: [
            Switch(
              value: isChatHistoryView,
              onChanged: changeView,
            )
          ],
        ),
        Flexible(fit: FlexFit.tight, child: view),
      ],
    );
  }
}
