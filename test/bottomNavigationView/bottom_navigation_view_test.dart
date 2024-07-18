import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your BottomNavigationView widget
import 'package:gemini_app/bottomNavigationView/bottom_navigation_view.dart';

void main() {
  testWidgets('BottomNavigationView Test', (WidgetTester tester) async {
    // Build the BottomNavigationView widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: const BottomNavigationView(),
          body: Builder(
            builder: (context) {
              return const IndexedStack(
                index: 0,
                children: [
                  Icon(Icons.search),
                  Icon(Icons.home),
                  Icon(Icons.person),
                ],
              );
            },
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Social'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Verify the initial icon
    expect(find.byIcon(Icons.search), findsOneWidget);

    // Tap on the 'Home' BottomNavigationBarItem
    await tester.tap(find.text('Home'));
    await tester.pump();

    // Verify the state after tapping 'Home'
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Tap on the 'Profile' BottomNavigationBarItem
    await tester.tap(find.text('Profile'));
    await tester.pump();

    // Verify the state after tapping 'Profile'
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
