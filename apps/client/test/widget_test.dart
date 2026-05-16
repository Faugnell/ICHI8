import 'package:flutter_test/flutter_test.dart';

import 'package:ichi8_client/main.dart';

void main() {
  testWidgets('shows ICHI8 home actions', (WidgetTester tester) async {
    await tester.pumpWidget(const Ichi8App());

    expect(find.text('ICHI8'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Play'), findsOneWidget);
  });
}
