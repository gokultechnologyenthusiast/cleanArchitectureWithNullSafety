import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart';
import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/number_trivia_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockUri extends Mock implements Uri {}

class MockHttpClient extends Mock implements http.Client {}

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

class MockInputConverter extends Mock implements InputConverter {}

final sl = GetIt.instance;

void main() {
  Widget getSUT() {
    return const MaterialApp(home: NumberTriviaPage());
  }

  setUpAll(
    () {
      //! Feature - Number Trivia
      //* Bloc
      sl.registerFactory(
        () => NumberTriviaBloc(
          getRandomNumberTrivia: sl(),
          getConcreteNumberTrivia: sl(),
          inputConverter: sl(),
        ),
      );

      //* usecase
      sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
      sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

      //* repository
      sl.registerLazySingleton<NumberTriviaRepository>(
        () => NumberTriviaRepositoryImpl(
          numberTriviaRemoteDatasource: sl(),
          numberTriviaLocalDataSource: sl(),
          networkInfo: sl(),
        ),
      );

      //* data sources
      sl.registerLazySingleton<NumberTriviaRemoteDatasource>(
        () => NumberTriviaRemoteDatasourceImpl(
          client: sl(),
        ),
      );

      sl.registerLazySingleton<NumberTriviaLocalDataSource>(
        () => NumberTriviaLocalDataSourceImpl(
          sharedPreferences: sl(),
        ),
      );

      //! core
      sl.registerSingleton<InputConverter>(MockInputConverter());
      sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

      //! external
      sl.registerSingleton<SharedPreferences>(MockSharedPreferences());
      sl.registerSingleton<http.Client>(MockHttpClient());
      sl.registerSingleton<InternetConnectionChecker>(
          MockInternetConnectionChecker());
    },
  );

  testWidgets(
      'When number trivia page is loaded there should be a NumberTriviaView',
      (tester) async {
    await tester.pumpWidget(getSUT());
    await tester.pump();
    expect(find.byType(NumberTriviaView), findsOneWidget);
  });
}
