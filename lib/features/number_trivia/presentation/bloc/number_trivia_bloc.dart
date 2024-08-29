// ignore_for_file: constant_identifier_names

import 'package:clean_architecture_with_nullsafty_new/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/input_converter.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/usecases/get_conceret_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE_MESSAGE =
    "Invalid Input - The number must be a integer or zero";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<GetTriviaForConcreteNumber>(_onGetTriviaForConcreteNumber);
    on<GetTriviaForRandomNumber>(_onGetTriviaForRandomNumber);
  }

  void _onGetTriviaForConcreteNumber(
      GetTriviaForConcreteNumber event, Emitter<NumberTriviaState> emit) async {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);
    emit(Loading());
    final state = await _state(inputEither!);

    emit(state);
  }

  void _onGetTriviaForRandomNumber(
      GetTriviaForRandomNumber event, Emitter<NumberTriviaState> emit) async {
    emit(Loading());
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    emit(_errorOrTrivia(failureOrTrivia!));
  }

  Future<NumberTriviaState> _state(Either<Failure, int> inputEither) {
    return inputEither.fold((failure) {
      return Future.value(const Error(message: INVALID_INPUT_FAILURE_MESSAGE));
    }, (integer) async {
      final failureOrTrivia =
          await getConcreteNumberTrivia(Params(number: integer));
      return _errorOrTrivia(failureOrTrivia!);
    });
  }
}

NumberTriviaState _errorOrTrivia(
    Either<Failure, NumberTrivia> failureOrTrivia) {
  return failureOrTrivia.fold(
    (failure) => Error(message: _mapFailureToMessage(failure)),
    (trivia) => Loaded(trivia: trivia),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
