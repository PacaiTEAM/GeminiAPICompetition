import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_app/views/profileView/text_box.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<Functions>()])
import "text_box_test.mocks.dart";

class Functions {
  void editField(String field) {}
}

void main() {
  MockFunctions mockFunctions = MockFunctions();
  Widget createWidgetUnderTest(
      {required String text,
      required String sectionName,
      required void Function()? onPressed}) {
    return MaterialApp(
      home: Scaffold(
        body: TextBox(
          text: text,
          sectionName: sectionName,
          onPressed: onPressed,
        ),
      ),
    );
  }

  group("TextBox Widget Test", () {
    testWidgets("Should render correctly", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        text: "Sample text",
        sectionName: "Sample sectionName",
        onPressed: () {},
      ));

      // Verify initial state
      expect(find.text("Sample text"), findsOneWidget);
      expect(find.text("Sample sectionName"), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets("Should respond to button press", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
          text: "Sample text",
          sectionName: "Sample sectionName",
          onPressed: () => mockFunctions.editField("Sample sectionName")));

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pump();
      verify(mockFunctions.editField("Sample sectionName")).called(1);
    });
  });
}
