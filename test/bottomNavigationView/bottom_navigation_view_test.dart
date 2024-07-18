import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your BottomNavigationView widget
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';

void main() {
  testWidgets('BottomNavigationView Test', (WidgetTester tester) async {
    // Build the BottomNavigationView widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationView(),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Social'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.people), findsOneWidget);
  });
}
