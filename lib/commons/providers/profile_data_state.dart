import 'package:flutter/material.dart';
import 'package:gemini_app/services/shared_preferences_service.dart';

class ProfileDataState extends ChangeNotifier {
  String userName = "";
  String avatarName = "";

  ProfileDataState() {
    getUsername();
    getAvatarName();
  }

  Future<void> getUsername() async {
    String value = await SharedPreferencesService.read("UserName");
    userName = value;
    notifyListeners();
  }

  Future<void> getAvatarName() async {
    String value = await SharedPreferencesService.read("AvatarName");
    avatarName = value;
    notifyListeners();
  }

  Future<void> setUsername(String value) async {
    await SharedPreferencesService.write("UserName", value);
    userName = value;
    notifyListeners();
  }

  Future<void> setAvatarName(String value) async {
    await SharedPreferencesService.write("AvatarName", value);
    avatarName = value;
    notifyListeners();
  }
}
