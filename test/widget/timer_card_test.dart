import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/app_data.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/ui/widgets/finished_banner.dart';
import 'package:timer/ui/widgets/timer_card.dart';

void main() {
  final mockTaskData = TaskData(
    id: "1",
    title: "1st",
    description: "1st description",
    duration: const Duration(hours: 1, minutes: 1, seconds: 1),
    isActive: true,
    registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
  );
  group('TimerCard test cases', () {
    testWidgets("check the presence of title,description and other texts",
        (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TimerCard(
              taskData: mockTaskData,
            ),
          ),
        ),
      );
      final textFinder = find.byType(Text);
      expect(
        textFinder,
        findsAtLeastNWidgets(3),
      );
    });
  });
  testWidgets("Checks the presence of mark comlplete button on zero duration",
      (widgetTester) async {
    mockTaskData.duration = Duration.zero;
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimerCard(
            taskData: mockTaskData,
          ),
        ),
      ),
    );
    final buttonFinder = find.byType(MaterialButton);
    expect(
      buttonFinder,
      findsOneWidget,
    );
    expect(find.text(AppData.markCompleteText), findsOneWidget);
  });

  testWidgets(
      "Checks the presence of Finished Banner widget button on zero duration",
      (widgetTester) async {
    mockTaskData.duration = Duration.zero;
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimerCard(
            taskData: mockTaskData,
          ),
        ),
      ),
    );
    final widgetFinder = find.byType(FinishedBanner);
    expect(
      widgetFinder,
      findsOneWidget,
    );
    expect(find.text(AppData.finishedText), findsOneWidget);
  });
}
