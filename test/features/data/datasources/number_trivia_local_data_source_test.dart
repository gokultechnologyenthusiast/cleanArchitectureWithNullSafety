import 'dart:convert';

import 'package:clean_architecture_reso/features/core/constants/sharedpreference_constants.dart';
import 'package:clean_architecture_reso/features/core/error/exceptions.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';
import 'number_trivia_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  final mockSharedPreference = MockSharedPreferences();
  NumberTriviaLocalDataSourceImpl? numberTriviaLocalDataSource;
  setUp(() {
    numberTriviaLocalDataSource = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: mockSharedPreference);
  });

  group('get last number trivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(jsonDecode(fixture('trivia_cached.json')));
    test(
        "should retrurn NumberTrivia from sharedPreferences when there is "
        "one in the cache", () async {
      // arrange
      when(mockSharedPreference.getString(any))
          .thenReturn(fixture("trivia_cached.json"));
      // act
      final result = await numberTriviaLocalDataSource!.getLastNumberTrivia();
      // assert
      verify(
          mockSharedPreference.getString(SharedPreferenceConstants.cashedKey));
      expect(result, equals(tNumberTriviaModel));
    });

    test("should throw a CachedException when there is not a cached value", () {
      // arrange
      when(mockSharedPreference.getString(any)).thenReturn('');
      // act
      final call = numberTriviaLocalDataSource!.getLastNumberTrivia;
      // assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('cache number trivia', () {
    final tNumberTriviaModel = NumberTriviaModel(text: "test", number: 1);
    test("should call sharedPreference to cache the data", () {
      // arrange
      when(mockSharedPreference.setString(any, any))
          .thenAnswer((realInvocation) async => true);
      // act
      numberTriviaLocalDataSource!.cacheNumberTrivia(tNumberTriviaModel);
      final expectedJsonString = jsonEncode(tNumberTriviaModel.toJson());
      // assert
      verify(mockSharedPreference.setString(
          SharedPreferenceConstants.cashedKey, expectedJsonString));
    });
  });
}
