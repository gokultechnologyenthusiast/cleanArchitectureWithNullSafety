import 'dart:convert';

import 'package:clean_architecture_with_nullsafty_new/core/error/exceptions.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class MockUri extends Mock implements Uri {}

class MochHttpClient extends Mock implements http.Client {}

void main() {
  late NumberTriviaRemoteDatasourceImpl numberTriviaRemoteDataSourceImpl;
  late MochHttpClient mochHttpClient;

  setUp(() {
    mochHttpClient = MochHttpClient();
    numberTriviaRemoteDataSourceImpl =
        NumberTriviaRemoteDatasourceImpl(client: mochHttpClient);
    registerFallbackValue(MockUri());
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mochHttpClient.get(any(), headers: any(named: "headers")))
        .thenAnswer((_) async => http.Response(fixture("trivia.json"), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(() => mochHttpClient.get(any(), headers: any(named: "headers")))
        .thenAnswer((_) async => http.Response("Something went wrong", 404));
  }

  group("getConcreteNumberTrivia", () {
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture("trivia.json")));
    test('''should perform a GET request on a URL with number
      being the endpoint and with application/json header''', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      numberTriviaRemoteDataSourceImpl.getConcreteNumberTrivia(tNumber);
      // assert
      verify(() => mochHttpClient.get(
          Uri.parse("http://numbersapi.com/$tNumber"),
          headers: {'Content-Type': 'application/json'}));
    });

    test("should return number trivia when the response code is 200 (success)",
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await numberTriviaRemoteDataSourceImpl
          .getConcreteNumberTrivia(tNumber);
      // assert
      expect(result, tNumberTriviaModel);
    });

    test("should throw a server exception when response code is 404 or other",
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = numberTriviaRemoteDataSourceImpl.getConcreteNumberTrivia;
      // assert
      expect(
          () => call(tNumber), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group("getRandomNumberTrivia", () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture("trivia.json")));
    test('''should perform a GET request on a URL with number
      being the endpoint and with application/json header''', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      numberTriviaRemoteDataSourceImpl.getRandomNumberTrivia();
      // assert
      verify(() => mochHttpClient.get(Uri.parse("http://numbersapi.com/random"),
          headers: {'Content-Type': 'application/json'}));
    });

    test("should return number trivia when the response code is 200 (success)",
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result =
          await numberTriviaRemoteDataSourceImpl.getRandomNumberTrivia();
      // assert
      expect(result, tNumberTriviaModel);
    });

    test("should throw a server exception when response code is 404 or other",
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = numberTriviaRemoteDataSourceImpl.getRandomNumberTrivia;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
