import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gemini_app/views/chatView/avatarView/avatar_view.dart';
import 'package:gemini_app/views/chatView/chatHistoryView/chat_history_view.dart';
import 'package:gemini_app/views/chatView/chat_view.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
        home: Scaffold(
            body: Flex(direction: Axis.vertical, children: [ChatView()])));
  }

  group("ChatView widget test", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets("should render avatarView initially",
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(AvatarView), findsOneWidget);
    });

    testWidgets("should render chatHistoryView when switch is pressed",
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(find.byType(ChatHistoryView), findsOneWidget);
    });
  });
}
