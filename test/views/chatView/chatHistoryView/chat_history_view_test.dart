import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gemini_app/views/chatView/chatHistoryView/chat_history_view.dart';
import 'package:gemini_app/widgets/chatBubble/chat_bubble.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: ChatHistoryView(),
    );
  }

  group("ChatHistoryView widget test", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(ChatBubble), findsNWidgets(7));
    });
  });
}
