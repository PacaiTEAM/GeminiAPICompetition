import 'package:flutter/material.dart';
import 'package:gemini_app/commons/constants.dart';
import 'package:gemini_app/services/geminiApi/gemini.dart';

class GeminiChatSessionState extends ChangeNotifier {
  Gemini gemini = Gemini();
  List<(String, UserRole)> chatHistory = [];

  GeminiChatSessionState() {
    gemini.startChat();
  }

  /// Add a message to the chat history with the indicated userType.
  void addToChatHistory(String message, UserRole userType) {
    chatHistory.add((message, userType));
  }

  /// Send a message to Gemini and update the chat history with Gemini's response.
  Future<void> sendMessageToGemini(String message) async {
    String response = await gemini.sendMessage(message);
    addToChatHistory(response, UserRole.gemini);
    notifyListeners();
  }
}
