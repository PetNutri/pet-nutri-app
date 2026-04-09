import 'package:flutter_test/flutter_test.dart';
import 'package:pet_nutri_app/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const PetNutriApp());
    expect(find.text('PetNutri 🐾'), findsOneWidget);
  });
}
