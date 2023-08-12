import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/ui/widgets/colon.dart';

void main() {
  group("Colon widget testing", () {
    testWidgets('Tests colon widget to display Text widget',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Colon(),
          ),
        ),
      );
      final textFinder = find.byType(Text);
      expect(textFinder, findsOneWidget);
    });
    testWidgets('Tests colon widget to display : ', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Colon(),
          ),
        ),
      );
      final textFinder = find.text(":");
      expect(textFinder, findsOneWidget);
    });
    testWidgets('Tests colon widget textStyle ', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Colon(),
          ),
        ),
      );
      final BuildContext context =
          widgetTester.element(find.byType(MaterialApp));
      final textFinder = find.byType(Text);
      expect(
        widgetTester.firstWidget<Text>(textFinder).style,
        Theme.of(context).textTheme.titleLarge,
      );
    });
  });
}
