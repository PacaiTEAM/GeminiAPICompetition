import 'package:flutter/material.dart';
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;

  const MainScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Note: Application state is not lost during reload. To reset the state, use hot
        // restart instead.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sarcastic Pig"),
      ),
      body: body,
      bottomNavigationBar: const BottomNavigationView(),
    );
  }
}
