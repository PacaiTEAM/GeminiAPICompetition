import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_app/commons/providers/gemini_chat_session_state.dart';

import 'package:gemini_app/views/chatView/chatHistoryView/chat_history_view.dart';
import 'package:gemini_app/widgets/chatBubble/chat_bubble.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GeminiChatSessionState>.value(
          value: GeminiChatSessionState(),
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: ChatHistoryView(),
        ),
      ),
    );
  }

  group("ChatHistoryView widget test", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(ChatBubble), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
