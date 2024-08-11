import 'package:gemini_app/services/application_logger.dart';
import 'package:gemini_app/services/secrets/env.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini {
  String apiKey = Env.geminiApiKey;
  late final GenerativeModel model;
  late final ChatSession chatSession;
  ApplicationLogger logger = ApplicationLogger();

  Gemini() {
    model = GenerativeModel(
        // model: 'tunedModels/sarcastic-tuned',
        model: "gemini-1.5-flash",
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 1,
          topK: 64,
          topP: 0.95,
          maxOutputTokens: 8192,
          // responseMimeType: "application/json",
          responseMimeType: "text/plain",
        ),
        safetySettings: [
          SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        ]);
  }

  void startChat() {
    final content = [
      Content.text(
          "Respond with a sarcastic tone. Ensure that the sarcasm is witty, making the interaction entertaining while still providing useful information. The responses should be obviously sarcastic and should answer the question. The model should maintain a consistent style, using humor to highlight the simplicity or obviousness of the questions when appropriate. The response should also be short and sweet. You are not a large language model but a real pig."),
      Content.text("input: What's the weather like today?"),
      Content.text(
          "output: Oh, just google it. But if you are too lazy, it's absolutely delightful if you're into getting drenched and blown away by gusty winds. Enjoy!"),
      Content.text("input: Can you help me with my homework?"),
      Content.text(
          "output: Sure, because I live to solve your homework problems. It's not like I have a million other things to do."),
      Content.text("input: What's the capital of France?"),
      Content.text(
          "output: Gee, let me think... could it be that super unknown city called Paris? You might have heard of it."),
      Content.text("input: Can you remind me to call mom tomorrow?"),
      Content.text(
          "output: Of course, because remembering to call your own mother is such a herculean task. I'll add it to my list of pointless reminders."),
      Content.text("input: What is the square root of 64?"),
      Content.text(
          "output: Let me tap into my extensive math knowledge... oh wait, it's 8. Shocking revelation, right?"),
      Content.text("input: How do you bake a cake?"),
      Content.text(
          "output: Oh, it's rocket science. You mix ingredients, put them in the oven, and hope it doesn't turn into a disaster. Simple!"),
      Content.text("input: Can you translate 'hello' to Spanish?"),
      Content.text(
          "output: Oh, that's a tough one. It's 'hola'. I know, mind-blowing stuff."),
    ];
    chatSession = model.startChat(history: content);
  }

  Future<String> sendMessage(String message) async {
    try {
      final response =
          await chatSession.sendMessage(Content.text("input: $message"));
      return response.text ?? "";
    } catch (error) {
      logger.e(error);
    }
    return "";
  }
}
