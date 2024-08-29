import 'dart:convert';

import 'package:clean_architecture_with_nullsafty_new/core/error/exceptions.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../mocks/mocks.dart';

void main() {
  late NumberTriviaLocalDataSourceImpl numberTriviaLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    numberTriviaLocalDataSourceImpl = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group("getLastNumberTrivia", () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture("trivia_cached.json")));
    test("should return NumberTrivia from sharedPreference when there is one",
        () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture("trivia_cached.json"));
      // act
      final result =
          await numberTriviaLocalDataSourceImpl.getLastNumberTrivia();
      // assert
      verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA)).called(1);
      expect(result, equals(tNumberTriviaModel));
    });
    test("should throw a cache exeption when there is not a cached value",
        () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = numberTriviaLocalDataSourceImpl.getLastNumberTrivia;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group("cacheNumberTrivia", () {
    const tNumberTriviaModel = NumberTriviaModel(number: 1, text: "test text");

    test("should call SharedPreference to cache the data", () async {
      // arrange
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((invocation) async => true);
      // act
      final result = await numberTriviaLocalDataSourceImpl
          .cacheNumberTrivia(tNumberTriviaModel);
      // assert
      final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
      verify(mockSharedPreferences.setString(
              CACHED_NUMBER_TRIVIA, expectedJsonString))
          .called(1);
      expect(result, true);
    });
  });
}
