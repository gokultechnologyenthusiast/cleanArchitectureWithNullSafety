import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

import 'get_conceret_number_trivia_test.mocks.dart';

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(text: "test", number: 1);
  test("should get trivia from the repository", () async {
    // arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer(
      (invocation) async => const Right(tNumberTrivia),
    );
    // act
    final result = await usecase.call(NoParams());
    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia()).called(1);
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
