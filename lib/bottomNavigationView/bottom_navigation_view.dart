import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.search),
    Icon(Icons.home),
    Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Social',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.people),
        ),
      ],
    );
  }
}
