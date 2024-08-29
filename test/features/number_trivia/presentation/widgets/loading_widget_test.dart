import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "LoadingWidget should show CircularProgressIndicator",
    (tester) async {
      // arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LoadingWidget(),
          ),
        ),
      );
      // act
      final loadingWidget = find.byType(LoadingWidget);
      // assert
      expect(loadingWidget, findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );
}
