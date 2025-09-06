import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/src/responsive.dart';

void main() {
  testWidgets('example builds', (tester) async {
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) {
        Responsive.init(context);
        return child!;
      },
      home: const Scaffold(body: Text('ok')),
    ));
    expect(find.text('ok'), findsOneWidget);
  });
}
