import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  GetRandomNumberTrivia,
  GetConcreteNumberTrivia,
  InputConverter,
  SharedPreferences,
  http.Client,
  InternetConnectionChecker,
  Uri,
  NumberTriviaRemoteDatasource,
  NumberTriviaLocalDataSource,
  NetworkInfo,
  NumberTriviaBloc
])
export 'mocks.mocks.dart';
