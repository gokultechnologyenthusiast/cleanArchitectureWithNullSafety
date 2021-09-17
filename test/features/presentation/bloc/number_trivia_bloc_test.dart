import 'package:clean_architecture_reso/features/core/error/failures.dart';
import 'package:clean_architecture_reso/features/core/usecase/usecase.dart';
import 'package:clean_architecture_reso/features/core/util/input_converter.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_reso/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_bloc_test.mocks.dart';

@GenerateMocks([GetConcreteNumberTrivia, GetRandomNumberTrivia, InputConverter])
void main() {
  final mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
  final mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
  final mockInputConverter = MockInputConverter();
  NumberTriviaBloc? bloc;

  setUp(() {
    bloc = NumberTriviaBloc(
        concrete: mockGetConcreteNumberTrivia,
        random: mockGetRandomNumberTrivia,
        inputConverter: mockInputConverter);
  });

  test("initialState should be Empty", () {
    // assert
    expect(bloc!.state, equals(Empty()));
  });

  group('GetTriviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;
    final tNumberTrivia = NumberTrivia(text: 'test trivia', number: 1);

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Right(tNumberParsed));

    void setUpMockConcreteNumberTriviaSuccess() =>
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((realInvocation) async => Right(tNumberTrivia));
    test(
        'should call the InputConverter to validate and convert the string '
        'to unsigned integer', () async {
      // arrange
      setUpMockInputConverterSuccess();
      setUpMockConcreteNumberTriviaSuccess();
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      // assert
      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
    });

    test("should emit [ERROR] when the input is invalid ", () {
      // arrange
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));
      // assert later
      final expected = [
        Error(message: INVALID_INPUT_FAILURE_MESSAGE),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
    });

    test("should get data from the concrete use case", () async {
      // arrange
      setUpMockInputConverterSuccess();
      setUpMockConcreteNumberTriviaSuccess();
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockGetConcreteNumberTrivia(any));
      // assert
      verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
    });

    test("should emit [Loading, Loaded] when data is gotten successfully", () {
      // arrange
      setUpMockInputConverterSuccess();
      setUpMockConcreteNumberTriviaSuccess();
      // assert later
      final expected = [
        Loading(),
        Loaded(tNumberTrivia),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
    });

    test("should emit [Loading, Error] when getting data fails", () {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((realInvocation) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
    });

    test(
        "should emit [Loading, Error] with a proper message for the error "
        "when getting data fails", () {
      // arrange
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((realInvocation) async => Left(CacheFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForConcreteNumber(tNumberString));
    });
  });

  group('GetTriviaForRandomNumber', () {
    final tNumberTrivia = NumberTrivia(text: 'test trivia', number: 1);

    test("should get data from the random use case", () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((realInvocation) async => Right(tNumberTrivia));
      // act
      bloc!.add(GetTriviaForRandomNumber());
      await untilCalled(mockGetRandomNumberTrivia(any));
      // assert
      verify(mockGetRandomNumberTrivia(NoParams()));
    });

    test("should emit [Loading, Loaded] when data is gotten successfully", () {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((realInvocation) async => Right(tNumberTrivia));
      // assert later
      final expected = [
        Loading(),
        Loaded(tNumberTrivia),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForRandomNumber());
    });

    test("should emit [Loading, Error] when getting data fails", () {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((realInvocation) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForRandomNumber());
    });

    test(
        "should emit [Loading, Error] with a proper message for the error "
        "when getting data fails", () {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((realInvocation) async => Left(CacheFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(bloc!.stream, emitsInOrder(expected));
      // act
      bloc!.add(GetTriviaForRandomNumber());
    });
  });
}
