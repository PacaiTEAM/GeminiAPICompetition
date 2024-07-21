import 'package:envied/envied.dart';

part 'env.g.dart';

// https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GEMINI_API_KEY', obfuscate: true)
  static String geminiApiKey = _Env.geminiApiKey;
}
