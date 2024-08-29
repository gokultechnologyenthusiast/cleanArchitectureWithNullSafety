import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/widgets.dart';

void main() {
  testWidgets(
    "TriviaDisplay should show correct data",
    (tester) async {
      // arrange
      const tNumberTrivia = NumberTrivia(text: "test text", number: 1);
      // act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TriviaDisplay(
              trivia: tNumberTrivia,
            ),
          ),
        ),
      );
      final numberText = find.text("1");
      final triviaText = find.text("test text");
      // assert
      expect(numberText, findsOneWidget);
      expect(triviaText, findsOneWidget);
    },
  );
}
