import 'package:speech_to_text/speech_to_text.dart';

class Microphone {
  SpeechToText? speech;

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
      onStatus: (status) => {print(status)},
      onError: (error) =>
          print('Error initializing speech recognition: $error'),
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
  void getInput() async {
    bool permissionGiven = await hasPermission();
    if (permissionGiven) {
      // TODO: might need to set the locale to detect the language being spoken
      print("Listening to microphone...");
      await speech?.listen(onResult: (result) {
        print(result.hasConfidenceRating);
        print(result.recognizedWords);
      });
    }
  }
}
