import 'package:flutter/material.dart';

class GetInformation extends StatelessWidget {
  final void Function() updateView;

  const GetInformation({super.key, required this.updateView});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: TextEditingController(),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email address',
              hintStyle: TextStyle(color: Colors.white),
              prefix: Icon(Icons.mail),
            ),
          ),
          TextField(
            controller: TextEditingController(),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
              hintStyle: TextStyle(color: Colors.white),
              prefix: Icon(Icons.mail),
            ),
          ),
        ],
      ),
    );
  }
}
