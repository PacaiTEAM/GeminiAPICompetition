import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gemini_app/services/firebase/firebase_options.dart';

class FirebaseWrapper {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> set(data, String path) async {
    final DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.set(data);
  }

  static Future<void> update(data, String path) async {
    final DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    // get a key for a new post
    final key = ref.push().key;
    final Map<String, Map> updates = {};
    updates['$key'] = data;
    ref.update(updates);
  }

  static Future<Object?> get(String path) async {
    final DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    final snapshot = await ref.get();
    return snapshot.value;
  }
}
