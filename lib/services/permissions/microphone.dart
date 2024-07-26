import 'package:gemini_app/services/application_logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Microphone {
  late SpeechToText speech;
  ApplicationLogger logger = ApplicationLogger();

  Microphone() {
    speech = SpeechToText();
  }

  /// Requests for microphone permission.
  ///
  /// This method is used to check if microphone permissions has been given by the user.
  /// If permission is not given, it would request for the user's permission.
  ///
  /// @returns true if microphone permission is given, false otherwise
  Future<bool> getPermission() async {
    try {
      if (!(await hasPermission())) {
        await Permission.microphone.request();
      }
      return hasPermission();
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  /// Checks if microphone permission has been given.
  ///
  /// @returns true if microphone permission is given, false otherwise
  Future<bool> hasPermission() async {
    try {
      PermissionStatus status = await Permission.microphone.status;
      logger.i("Microphone Permission: $status");
      return status.isGranted;
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  /// Initialize the speech recognition services
  ///
  /// @returns true if initialized successfully, false otherwise
  Future<bool> initialize() async {
    try {
      if (await hasPermission()) {
        return await speech.initialize(
          onStatus: (status) {
            logger.i("Microphone Status: $status");
          },
          onError: (error) {
            // https://pub.dev/documentation/speech_to_text/latest/speech_to_text/SpeechErrorListener.html
            logger.e('Error initializing speech recognition: $error');
          },
        );
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  /// Starts listening to the microphone input.
  Future<void> startListening(bool permissionGiven) async {
    try {
      if (permissionGiven && speech.isAvailable) {
        // TODO: need to set the locale to detect the language being spoken
        logger.i("Listening to microphone...");
        await speech.listen(
          onResult: (result) {
            logger.d(
                "${result.recognizedWords} ${result.confidence} ${result.alternates}");
          },
          listenOptions: SpeechListenOptions(
            cancelOnError: true,
          ),
        );
      } else {
        logger.e(
            "Microphone permission is not given. Permission: $permissionGiven Initialized: ${speech.isAvailable}");
      }
    } catch (error) {
      logger.e(error);
    }
  }

  /// Stop listening on the microphone.
  Future<void> stopListening() async {
    try {
      if (speech.isListening) {
        await speech.stop();
      } else {
        logger.e("Microphone is not stopped. Microphone is not listening.");
      }
    } catch (error) {
      logger.e(error);
    }
  }

  /// Get the voice input in text.
  ///
  /// @returns the voice input in text.
  String getInput() {
    if (speech.hasRecognized) {
      logger.d("Recognized words: ${speech.lastRecognizedWords}");
      return speech.lastRecognizedWords;
    } else {
      logger.e("No words are recognized.");
    }
    return "";
  }
}
