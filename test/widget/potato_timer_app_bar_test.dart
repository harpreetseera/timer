import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/app_data.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/appbar/potato_timer_app_bar.dart';

void main() {
  group("PotatoTimerAppBar widget testing", () {
    testWidgets('Tests PotatoTimerAppBar widget to contain AppBar',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: PotatoTimerAppBar(),
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
            appBar: PotatoTimerAppBar(),
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
            appBar: PotatoTimerAppBar(),
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
