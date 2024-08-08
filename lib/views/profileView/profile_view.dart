import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/services/shared_preferences_service.dart';
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
  String userName = "";
  String avatarName = "";
  final _controller = TextEditingController();

  String getErrorText(String text) {
    if (text.isEmpty) return 'Please enter a name';
    if (text.length < 3) return 'Name must be at least 3 characters long';
    if (text.length > 15) return 'Name must be at most 15 characters long';
    return "";
  }

  void varDeclare() {
    SharedPreferencesService.read("UserName").then((value) => {
          setState(() {
            userName = value;
          })
        });
    SharedPreferencesService.read("AvatarName").then((value) => {
          setState(() {
            avatarName = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    varDeclare();
  }

  //Edit Field
  Future<void> editField(String field) async {
    String text = _controller.value.text;

    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) {
        String error = getErrorText(text);
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
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
                errorText: error,
              ),
              onChanged: (value) {
                // setState(() => error = getErrorText(value));
                setState(
                  () {
                    newValue = value;
                    error = getErrorText(value);
                  },
                );
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
                      SharedPreferencesService.write("UserName", userName);
                    } else {
                      avatarName = newValue;
                      SharedPreferencesService.write("AvatarName", avatarName);
                    }
                  });
                  Navigator.of(context).pop(newValue);
                },
              ),
            ],
          );
        });
      },
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

          // IconButton(
          //   onPressed: writeToFirebase,
          //   icon: const Icon(Icons.piano, size: 72, color: Colors.blue),
          // )
        ],
      ),
    );
  }
}
