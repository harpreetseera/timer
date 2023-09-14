import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/app_data.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/appbar/timer_app_bar.dart';

void main() {
  group("PotatoTimerAppBar widget testing", () {
    testWidgets('Tests PotatoTimerAppBar widget to contain AppBar',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: TimerAppBar(),
          ),
        ),
      );
      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsWidgets);
    });
    testWidgets('Tests PotatoTimerAppBar widget to contain App title ',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: TimerAppBar(),
          ),
        ),
      );
      final textFinder = find.text(AppData.appBarTitle);
      expect(textFinder, findsOneWidget);
    });
    testWidgets('Tests AppBar Elevation ', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: TimerAppBar(),
          ),
        ),
      );
      final appBarFinder = find.byType(AppBar);
      expect(
        widgetTester.firstWidget<AppBar>(appBarFinder).elevation,
        SizeConfig.appBarElevation,
      );
    });
  });
}
