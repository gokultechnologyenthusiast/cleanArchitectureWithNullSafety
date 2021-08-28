import 'dart:convert';

import 'package:clean_architecture_reso/features/core/error/exceptions.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  NumberTriviaRemoteDataSourceImpl? numberTriviaRemoteDataSourceImpl;
  var mockHttpClient = MockClient();

  setUp(() {
    numberTriviaRemoteDataSourceImpl =
        NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async => http.Response(fixture('trivia.json'), 200));
  }

  void setUpMockHttpClientFailure400() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async => http.Response('Something went wrong', 404));
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(jsonDecode(fixture('trivia.json')));

    test(
        'should perform a GET request on a URL with number being the '
        'endpoint and with application/json header', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      numberTriviaRemoteDataSourceImpl!.getConcreteNumberTrivia(tNumber);
      //assert
      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/$tNumber'),
          headers: {'Content-Type': 'application/json'}));
    });

    test("should return NumberTrivia when the response code is 200(success)",
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await numberTriviaRemoteDataSourceImpl!
          .getConcreteNumberTrivia(tNumber);
      // assert
      expect(result, equals(tNumberTriviaModel));
    });

    test(
        "should throw a ServerException when the response code is 404 or "
        "other", () {
      // arrange
      setUpMockHttpClientFailure400();
      // act
      final call = numberTriviaRemoteDataSourceImpl!.getConcreteNumberTrivia;
      // assert
      expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(jsonDecode(fixture('trivia.json')));

    test(
        'should perform a GET request on a URL with number being the '
        'endpoint and with application/json header', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      numberTriviaRemoteDataSourceImpl!.getRandomNumberTrivia();
      //assert
      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/random'),
          headers: {'Content-Type': 'application/json'}));
    });

    test("should return NumberTrivia when the response code is 200(success)",
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result =
          await numberTriviaRemoteDataSourceImpl!.getRandomNumberTrivia();
      // assert
      expect(result, equals(tNumberTriviaModel));
    });

    test(
        "should throw a ServerException when the response code is 404 or "
        "other", () {
      // arrange
      setUpMockHttpClientFailure400();
      // act
      final call = numberTriviaRemoteDataSourceImpl!.getRandomNumberTrivia;
      // assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
