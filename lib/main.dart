import 'package:flutter/material.dart';
import 'package:gemini_app/services/firebase/firebase.dart';

import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/views/profileView/profile_view.dart';
import 'package:gemini_app/views/greetingView/greeting_view.dart';
import 'package:gemini_app/views/start_view.dart';
import 'package:gemini_app/widgets/main_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseWrapper.initialize();
  // }

  void updateView(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sarcastic Pig',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 190, 240, 192)),
        fontFamily: "Montserrat",
        useMaterial3: true,
      ),
      initialRoute: StartView.id,
      routes: {
        StartView.id: (context) => const Scaffold(
              body: GreetingView(),
            ),
        GreetingView.id: (context) => const Scaffold(
              body: GreetingView(),
            ),
        ChatView.id: (context) => const MainScaffold(
              body: ChatView(),
            ),
        ProfileView.id: (context) => const MainScaffold(
              body: ProfileView(),
            ),
      },
    );
  }
}
