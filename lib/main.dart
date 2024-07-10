import 'package:flutter/material.dart';

import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sarcastic Pig',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 190, 240, 192)),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            // Note: Application state is not lost during reload. To reset the state, use hot
            // restart instead.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("SomeTitle"),
          ),
          body: const ChatView(),
          bottomNavigationBar: const BottomNavigationView(),
        ));
  }
}
