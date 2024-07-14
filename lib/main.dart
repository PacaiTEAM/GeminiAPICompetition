import 'package:flutter/material.dart';

import 'package:gemini_app/services/permissions/microphone.dart';
import 'package:gemini_app/views/chatView/avatarView/avatar_view.dart';
import 'package:gemini_app/views/chatView/historyView/history_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            // Note: Application state is not lost during reload. To reset the state, use hot
            // restart instead.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("SomeTitle"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarView(
                  microphone: Microphone(),
                ),
              ],
            ),
          ),
        ));
  }
}
