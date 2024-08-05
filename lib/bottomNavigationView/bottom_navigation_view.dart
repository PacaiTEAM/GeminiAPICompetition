import 'package:flutter/material.dart';
import 'package:gemini_app/views/chatView/chat_view.dart';
import 'package:gemini_app/views/profileView/profile_view.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int currIndex = 0;

  void navigateToNextView(BuildContext context, int index) {
    setState(() {
      currIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, ChatView.id);
        break;
      case 1:
        Navigator.pushNamed(context, ProfileView.id);
        break;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currIndex,
      onTap: (int newIndex) {
        navigateToNextView(context, newIndex);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'H O M E',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'P R O F I L E',
          icon: Icon(Icons.people),
        ),
      ],
    );
  }
}
