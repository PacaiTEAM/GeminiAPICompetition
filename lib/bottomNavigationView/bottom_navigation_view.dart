import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  final dynamic updateView;
  final int currentIndex;

  const BottomNavigationView(
      {super.key, required this.updateView, required this.currentIndex});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (int newIndex) {
        widget.updateView(newIndex);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'H O M E',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'S O C I A L',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'P R O F I L E',
          icon: Icon(Icons.people),
        ),
      ],
    );
  }
}
