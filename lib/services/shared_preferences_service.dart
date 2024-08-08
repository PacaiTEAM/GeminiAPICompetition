import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> write(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> read(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value ?? "";
  }
}
