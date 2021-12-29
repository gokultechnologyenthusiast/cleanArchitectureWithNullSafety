import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDatasource {
  Future<NumberTriviaModel>? getConcreteNumberTrivia(int? number);

  Future<NumberTriviaModel>? getRandomNumberTrivia();
}

class NumberTriviaRemoteDatasourceImpl implements NumberTriviaRemoteDatasource {
  NumberTriviaRemoteDatasourceImpl({required this.client});

  final http.Client client;

  @override
  Future<NumberTriviaModel>? getConcreteNumberTrivia(int? number) =>
      _getTriviaFromUrl("http://numbersapi.com/$number");

  @override
  Future<NumberTriviaModel>? getRandomNumberTrivia() =>
      _getTriviaFromUrl("http://numbersapi.com/random");

  Future<NumberTriviaModel>? _getTriviaFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
