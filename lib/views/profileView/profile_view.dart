import 'package:flutter/material.dart';
import 'package:gemini_app/commons/providers/profile_data_state.dart';
import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/views/profileView/text_box.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  static const String id = "/profileView";

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ApplicationLogger logger = ApplicationLogger();
  final _controller = TextEditingController();

  String getErrorText(String text) {
    if (text.isEmpty) return 'Please enter a name';
    if (text.length < 3) return 'Name must be at least 3 characters long';
    if (text.length > 15) return 'Name must be at most 15 characters long';
    return "";
  }

  //Edit Field
  Future<void> editField(String field, BuildContext context) async {
    String text = _controller.value.text;
    ProfileDataState profileDataState = context.read<ProfileDataState>();
    String newValue = "";

    void handleSave() async {
      if (field == "Username") {
        profileDataState.setUsername(newValue);
      } else {
        profileDataState.setAvatarName(newValue);
      }
      Navigator.of(context).pop(newValue);
    }

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
                onPressed: handleSave,
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ProfileDataState profileDataState = context.watch<ProfileDataState>();

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
                fontSize: 16,
                color: Color.fromARGB(255, 70, 69, 69),
              ),
            ),
          ),
          // User Name
          TextBox(
            text: profileDataState.userName,
            sectionName: "Username",
            onPressed: () => editField("Username", context),
          ),
          // Avatar Name
          TextBox(
            text: profileDataState.avatarName,
            sectionName: "Avatar Name",
            onPressed: () => editField("Avatar Name", context),
          ),
        ],
      ),
    );
  }
}
