import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_app/commons/constants.dart';
import 'package:gemini_app/widgets/chatBubble/chat_bubble.dart';

void main() {
  String message =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  UserRole userRole = UserRole.gemini;

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChatBubble(message: message, userRole: userRole),
    );
  }

  group("ChatBubble widget test", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(Text), findsOneWidget);
      expect(find.textContaining(message, findRichText: false), findsOneWidget);
    });

    testWidgets("should align to the left when the role is gemini",
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is Row &&
                widget.mainAxisAlignment == MainAxisAlignment.start,
          ),
          findsOneWidget);
    });

    testWidgets("should align to the right when the role is user",
        (WidgetTester tester) async {
      userRole = UserRole.user;
      await tester.pumpWidget(createWidgetUnderTest());

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is Row &&
                widget.mainAxisAlignment == MainAxisAlignment.end,
          ),
          findsOneWidget);
    });
  });
}
