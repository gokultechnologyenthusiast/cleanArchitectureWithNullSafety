import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumberTriviaEvent', () {
    group('GetTriviaForConcreteNumber', () {
      test(
        'should have correct props',
        () {
          // arrange
          const tNumberString = '1';
          const event = GetTriviaForConcreteNumber(tNumberString);

          // act & assert
          expect(event.props, [tNumberString]);
        },
      );
    });

    group('GetTriviaForRandomNumber', () {
      test(
        'should have empty props',
        () {
          // arrange
          var event = GetTriviaForRandomNumber();

          // act & assert
          expect(event.props, []);
        },
      );
    });
  });
}
