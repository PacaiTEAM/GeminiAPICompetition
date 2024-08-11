import 'package:flutter/material.dart';
import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/views/greetingView/getInformation/get_information.dart';
import 'package:gemini_app/views/greetingView/getInformation/get_username.dart';
import 'package:gemini_app/views/greetingView/greetingMessage/greeting_message.dart';
import 'package:gemini_app/views/greetingView/namingPig/naming_pig.dart';

class GreetingView extends StatefulWidget {
  static const String id = "/greetingView";

  const GreetingView({super.key});

  @override
  State<GreetingView> createState() => _GreetingViewState();
}

class _GreetingViewState extends State<GreetingView> {
  int _currentIndex = 0;

  Future<void> navigateToNextView() async {
    if (_currentIndex < 2) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushNamed(context, ChatView.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: IndexedStack(
        index: _currentIndex,
        alignment: Alignment.center,
        children: [
          GreetingMessage(updateView: navigateToNextView),
          NamingPig(updateView: navigateToNextView),
          GetUsername(updateView: navigateToNextView),
        ],
      ),
    );
  }
}
