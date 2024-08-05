import 'package:flutter/material.dart';
import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/views/greetingView/greeting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartView extends StatefulWidget {
  static const String id = "/startView";

  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  Future checkFirstSeen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = preferences.getBool("seen") ?? false;

    if (seen) {
      Navigator.pushNamed(context, ChatView.id);
    } else {
      await preferences.setBool("seen", true);
      Navigator.pushNamed(context, GreetingView.id);
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading..."),
    );
  }
}
