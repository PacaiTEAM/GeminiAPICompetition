import 'package:envied/envied.dart';

part 'env.g.dart';

// https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GEMINI_API_KEY', obfuscate: true)
  static String geminiApiKey = _Env.geminiApiKey;

  @EnviedField(varName: 'FIREBASE_API_KEY', obfuscate: true)
  static String firebaseApiKey = _Env.firebaseApiKey;
  @EnviedField(varName: 'FIREBASE_APP_ID', obfuscate: true)
  static String firebaseAppId = _Env.firebaseAppId;
  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID', obfuscate: true)
  static String firebaseMessagingSenderId = _Env.firebaseMessagingSenderId;
  @EnviedField(varName: 'FIREBASE_PROJECT_ID', obfuscate: true)
  static String firebaseProjectId = _Env.firebaseProjectId;
  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET', obfuscate: true)
  static String firebaseStorageBucket = _Env.firebaseStorageBucket;
  @EnviedField(varName: 'FIREBASE_MEASUREMENT_ID', obfuscate: true)
  static String firebaseMeasurementId = _Env.firebaseMeasurementId;
  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN', obfuscate: true)
  static String firebaseAuthDomain = _Env.firebaseAuthDomain;
  @EnviedField(varName: 'FIREBASE_DATABASE_URL', obfuscate: true)
  static String firebaseDatabaseUrl = _Env.firebaseDatabaseUrl;
  @EnviedField(varName: 'FIREBASE_ANDROID_CLIENT_ID', obfuscate: true)
  static String firebaseAndroidClientId = _Env.firebaseAndroidClientId;
  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID', obfuscate: true)
  static String firebaseIosClientId = _Env.firebaseIosClientId;
  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID', obfuscate: true)
  static String firebaseIosBundleId = _Env.firebaseIosBundleId;

  @EnviedField(varName: 'GOOGLE_SERVICES_API_KEY', obfuscate: true)
  static String googleServicesApiKey = _Env.googleServicesApiKey;
}
