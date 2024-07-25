import 'package:flutter/material.dart';
import 'package:gemini_app/views/greetingView/getInformation/get_information.dart';
import 'package:gemini_app/views/greetingView/greetingMessage/greeting_message.dart';
import 'package:gemini_app/views/greetingView/namingPig/naming_pig.dart';

class GreetingView extends StatefulWidget {
  const GreetingView({super.key});

  @override
  State<GreetingView> createState() => _GreetingViewState();
}

class _GreetingViewState extends State<GreetingView> {
  int _currentIndex = 0;

  void navigateToNextView() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateToNextView,
      child: Container(
        color: Colors.black,
        child: IndexedStack(
          index: _currentIndex,
          alignment: Alignment.center,
          children: [
            const GreetingMessage(),
            NamingPig(updateView: navigateToNextView),
            GetInformation(updateView: navigateToNextView),
          ],
        ),
      ),
    );
  }
}
