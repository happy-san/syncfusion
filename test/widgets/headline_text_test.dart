import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:syncfusion_cartesian_chart/widgets/headline_text.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: const HeadlineText('T'),
      ),
    );

    // Create the Finders.
    final titleFinder = find.text('T');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}
