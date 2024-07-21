import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your BottomNavigationView widget
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Functions>()])
import "bottom_navigation_view_test.mocks.dart";

class Functions {
  updateView(int index) {}
}

void main() {
  MockFunctions mockFunctions = MockFunctions();

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationView(
          updateView: mockFunctions.updateView,
          currentIndex: 0,
        ),
      ),
    );
  }

  group("BottomNavigationView Test", () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      // Build the BottomNavigationView widget
      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      // Verify initial state
      expect(find.text('H O M E'), findsOneWidget);
      expect(find.text('S O C I A L'), findsOneWidget);
      expect(find.text('P R O F I L E'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.people), findsOneWidget);
    });

    testWidgets('should click on social', (WidgetTester tester) async {
      // Build the BottomNavigationView widget
      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.tap(find.text("S O C I A L"));
      await tester.pump();

      verify(mockFunctions.updateView(1)).called(1);
    });

    testWidgets('should click on home', (WidgetTester tester) async {
      // Build the BottomNavigationView widget
      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.tap(find.text("H O M E"));
      await tester.pump();

      verify(mockFunctions.updateView(0)).called(1);
    });

    testWidgets('should click on profile', (WidgetTester tester) async {
      // Build the BottomNavigationView widget
      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.tap(find.text("P R O F I L E"));
      await tester.pump();

      verify(mockFunctions.updateView(2)).called(1);
    });
  });
}
