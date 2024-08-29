import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';

@GenerateMocks([NumberTriviaRepository])
import 'get_conceret_number_trivia_test.mocks.dart';

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: "test", number: 1);
  test("should get trivia for the number from the repository", () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any)).thenAnswer(
      (invocation) async => const Right(tNumberTrivia),
    );
    // act
    final result = await usecase.call(const Params(number: tNumber));
    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
        .called(1);
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
