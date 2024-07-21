import 'package:flutter/material.dart';
import 'package:gemini_app/views/profileView/text_box.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //final currentUser = FirebaseAuth.instance.currentUser;
  String userName = "Lemeng";
  String AvatarName = "ZJ";

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
                  AvatarName = newValue;
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
          const Text(
            "wang.15543@osu.edu",
            style:
                TextStyle(fontSize: 16, color: Color.fromARGB(255, 62, 62, 62)),
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
            text: AvatarName,
            sectionName: "Avatar Name",
            onPressed: () => editField("Avatar Name"),
          )
        ],
      ),
    );
  }
}
