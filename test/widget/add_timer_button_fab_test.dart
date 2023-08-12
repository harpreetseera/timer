import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/app_data.dart';
import 'package:ipotato_timer/ui/widgets/button/add_timer_button_fab.dart';

void main() {
  group("AddTimerFAB Test cases", () {
    testWidgets("Fab is pumped ", (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: AddTimerButtonFAB(),
          ),
        ),
      );
      final widgetFinder = find.byType(FloatingActionButton);
      expect(widgetFinder, findsOneWidget);
    });
    testWidgets("Fab is pumped and has expected child", (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: AddTimerButtonFAB(),
          ),
        ),
      );
      final widgetFinder = find.byType(FloatingActionButton);
      expect(
        widgetTester
            .firstWidget<FloatingActionButton>(widgetFinder)
            .child
            .runtimeType,
        SvgPicture,
      );
    });

    testWidgets("Fab is pumped and tapped", (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: AddTimerButtonFAB(),
          ),
        ),
      );
      await widgetTester.tap(find.byType(FloatingActionButton));

      await widgetTester.pump();
      expect(
        find.text(AppData.addtasktext),
        findsWidgets,
      );
    });
  });
}
