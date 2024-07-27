import 'package:flutter/material.dart';

import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';
import 'package:gemini_app/views/profileView/profile_view.dart';

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
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Note: Application state is not lost during reload. To reset the state, use hot
          // restart instead.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Sarcastic Pig"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [ChatView(), Text("Social View"), ProfileView()],
        ),
        bottomNavigationBar: BottomNavigationView(
          currentIndex: currentIndex,
          updateView: updateView,
        ),
      ),
    );
  }
}
