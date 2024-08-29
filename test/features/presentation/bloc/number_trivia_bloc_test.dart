import 'package:clean_architecture_with_nullsafty_new/core/error/failure.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;
  late NumberTriviaBloc numberTriviaBloc;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();
    numberTriviaBloc = NumberTriviaBloc(
        getRandomNumberTrivia: mockGetRandomNumberTrivia,
        getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
        inputConverter: mockInputConverter);
  });

  test("initial state should be Empty", () {
    // assert
    expect(numberTriviaBloc.state, equals(Empty()));
  });

  group("getTriviaForConcreteNumber", () {
    const tNumberString = "1";
    const tNumberParsed = 1;
    const tNumberTrivia = NumberTrivia(text: "test text", number: 1);

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenAnswer((_) => const Right(tNumberParsed));

    test(
        "should call InputConverter to validate and convert the string to an unsigned integer",
        () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      // assert
      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
    });

    test("should emit [Error] when the input is invalid", () async {
      // arrange
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));
      // assert later
      final expected = [
        Loading(),
        const Error(message: INVALID_INPUT_FAILURE_MESSAGE),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
    });

    test("should get data from the concrete use case", () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockGetConcreteNumberTrivia(any));
      // assert
      verify(mockGetConcreteNumberTrivia(const Params(number: tNumberParsed)));
    });

    test("should emit [Loading,Loaded] when data is gotten successfully",
        () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // assert later
      final expected = [
        Loading(),
        const Loaded(
          trivia: tNumberTrivia,
        ),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
    });

    test("should emit [Loading,Error] when getting data fails", () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
    });

    test('''
        should emit [Loading,Error] with a proper message 
        for the error when getting data fails
        ''', () async {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      // assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(const GetTriviaForConcreteNumber(tNumberString));
    });
  });

  group("getTriviaForRandomNumber", () {
    const tNumberTrivia = NumberTrivia(text: "test text", number: 1);

    test("should get data from the random use case", () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      numberTriviaBloc.add(GetTriviaForRandomNumber());
      await untilCalled(mockGetRandomNumberTrivia(any));
      // assert
      verify(mockGetRandomNumberTrivia(NoParams()));
    });

    test("should emit [Loading,Loaded] when data is gotten successfully",
        () async {
      // arrange;
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // assert later
      final expected = [
        Loading(),
        const Loaded(
          trivia: tNumberTrivia,
        ),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(GetTriviaForRandomNumber());
    });

    test("should emit [Loading,Error] when getting data fails", () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(GetTriviaForRandomNumber());
    });

    test('''
        should emit [Loading,Error] with a proper message 
        for the error when getting data fails
        ''', () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      // assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(numberTriviaBloc.stream, emitsInOrder(expected));
      // act
      numberTriviaBloc.add(GetTriviaForRandomNumber());
    });
  });
}
