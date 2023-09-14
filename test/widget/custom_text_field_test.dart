import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/app_data.dart';
import 'package:timer/ui/widgets/custom_text_field.dart';

void main() {
  group("CustomTextfield Test cases", () {
    testWidgets("Tests entered text ", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              controller: TextEditingController(),
              label: AppData.labelText,
              hint: AppData.titleHintText,
            ),
          ),
        ),
      );

      await widgetTester.enterText(find.byType(TextFormField), 'Custom Title');
      expect(find.text('Custom Title'), findsOneWidget);
    });
  });
}
