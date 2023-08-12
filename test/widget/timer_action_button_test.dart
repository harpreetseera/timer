import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';

void main() {
  group("Timer action button test cases", () {
    final mockTestData = TaskData(
      id: "1",
      title: "1st",
      description: "1st description",
      duration: const Duration(hours: 1, minutes: 1, seconds: 1),
      isActive: true,
      registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
    );

    testWidgets("2 TimerActionButton available", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TimerCard(
              taskData: mockTestData,
            ),
          ),
        ),
      );
      final widgetFinder = find.byType(IconButton);
      expect(widgetFinder, findsAtLeastNWidgets(2));
    });

    testWidgets("pause icon built", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TimerCard(
              taskData: mockTestData,
            ),
          ),
        ),
      );
      final widgetFinder = find.byIcon(Icons.pause);
      expect(widgetFinder, findsOneWidget);
    });
    testWidgets("play icon built", (widgetTester) async {
      final editedMockTest = mockTestData;
      editedMockTest.isActive = false;
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TimerCard(
              taskData: mockTestData,
            ),
          ),
        ),
      );
      final widgetFinder = find.byIcon(Icons.play_arrow);
      expect(widgetFinder, findsOneWidget);
    });
    testWidgets("stop icon built", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TimerCard(
              taskData: mockTestData,
            ),
          ),
        ),
      );
      final widgetFinder = find.byIcon(Icons.stop_rounded);
      expect(widgetFinder, findsOneWidget);
    });
  });
}
