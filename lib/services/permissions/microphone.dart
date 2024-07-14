import 'package:speech_to_text/speech_to_text.dart';
import 'package:logger/logger.dart';

class Microphone {
  SpeechToText? speech;
  Logger logger = Logger();

  Microphone() {
    speech = SpeechToText();
  }

  /// Requests for microphone permission.
  ///
  /// This method is used to check if microphone permissions has been given by the user.
  /// For the first attempt, it will prompt the user for permission.
  /// For subsequent attempts, if permission has been previously denied, the application would not prompt the user for permission again.
  ///
  /// @returns if microphone permission is given
  Future<bool> getPermission() async {
    // Initialize would prompt user for permission
    bool? hasPermission = await speech?.initialize(
      onStatus: (status) {
        logger.i("Microphone Status: $status");
      },
      onError: (error) {
        logger.e('Error initializing speech recognition: $error');
      },
    );

    if (hasPermission != null && !hasPermission) {
      // TODO: Maybe ask the user to provide microphone access in the settings if it is not provided
    }
    return hasPermission ?? false;
  }

  /// Checks if microphone permission has been given.
  ///
  /// @returns if microphone permission is given
  Future<bool> hasPermission() async {
    bool permission = await speech?.hasPermission ?? false;
    bool isInitialized = speech?.isAvailable ?? false;

    return isInitialized && permission;
  }

  /// Retrieves the microphone input.
  ///
  ///
  void getInput(bool permissionGiven) async {
    if (permissionGiven) {
      // TODO: need to set the locale to detect the language being spoken
      logger.i("Listening to microphone...");
      await speech?.listen(
          onResult: (result) {
            logger.i(
                "${result.recognizedWords} ${result.confidence} ${result.alternates}");
          },
          listenOptions: SpeechListenOptions(cancelOnError: true));
    }
  }
}
