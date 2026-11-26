import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

void main() {
  testWidgets('suffix icon stays tappable while the field is read-only', (
    tester,
  ) async {
    var taps = 0;
    final controller = TextEditingController(text: 'Old name');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(
            controller: controller,
            hintText: 'الاسم',
            textInputType: TextInputType.name,
            readOnly: true,
            enableInteractiveSelection: false,
            suffixIcon: IconButton(
              onPressed: () => taps++,
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    expect(taps, 1);
  });
}
