import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/views/profileView/text_box.dart';

class ProfileView extends StatefulWidget {
  static const String id = "/profileView";

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ApplicationLogger logger = ApplicationLogger();

  //final currentUser = FirebaseAuth.instance.currentUser;
  String userName = "Xixi";
  String avatarName = "Fifi";
  String userEmail = "abcdefg@gmail.com";

  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  // await ref.set({
  //   "name": "Xixi",
  //   "avatar": "Fifi",
  //   "email": "abcdefg@gmail.com",
  // });
  // final newPostKey = FirebaseDatabase.instance.ref().child('posts').push().key;

  writeToFirebase() async {
    // DatabaseReference ref = FirebaseDatabase.instance.ref();
    // await ref.set({
    //   "name": userName,
    //   "avatar": avatarName,
    //   "email": userEmail,
    // });
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
    await ref.set({
      "name": "John",
      "age": 18,
      "address": {"line1": "100 Mountain View"}
    }).catchError((err) {
      logger.e('Error: $err');
    });
  }

  //Edit Field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[700],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          // save button
          TextButton(
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                if (field == "Username") {
                  userName = newValue;
                } else {
                  avatarName = newValue;
                }
              });
              Navigator.of(context).pop(newValue);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 25),
          // Profile Pic
          const Icon(Icons.person, size: 72),
          // User Email
          Text(
            userEmail,
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 62, 62, 62)),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 25),

          // User Details
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "My Details",
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 70, 69, 69)),
            ),
          ),
          // User Name
          TextBox(
            text: userName,
            sectionName: "Username",
            onPressed: () => editField("Username"),
          ),
          // Avatar Name
          TextBox(
            text: avatarName,
            sectionName: "Avatar Name",
            onPressed: () => editField("Avatar Name"),
          ),

          IconButton(
            onPressed: writeToFirebase,
            icon: const Icon(Icons.piano, size: 72, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
