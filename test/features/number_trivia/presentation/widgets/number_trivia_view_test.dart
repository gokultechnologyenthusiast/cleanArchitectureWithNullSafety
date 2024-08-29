import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart';
import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/number_trivia_view.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../mocks/mocks.dart';

final sl = GetIt.instance;
void main() {
  late MockNumberTriviaBloc mockNumberTriviaBloc;
  Widget getSUT() {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => sl<NumberTriviaBloc>(),
        child: const Scaffold(body: NumberTriviaView()),
      ),
    );
  }

  setUpAll(
    () {
      mockNumberTriviaBloc = MockNumberTriviaBloc();
      //! Feature - Number Trivia
      //* Bloc
      sl.registerFactory<NumberTriviaBloc>(
        () => mockNumberTriviaBloc,
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
      sl.registerSingleton<http.Client>(MockClient());
      sl.registerSingleton<InternetConnectionChecker>(
          MockInternetConnectionChecker());
    },
  );

  group(
    "NumberTriviaView",
    () {
      const tNumberTrivia = NumberTrivia(text: "test", number: 1);
      testWidgets(
          'when number trivia state is loading should show loading view',
          (tester) async {
        when(mockNumberTriviaBloc.state).thenAnswer(
          (_) => Loading(),
        );

        when(mockNumberTriviaBloc.stream).thenAnswer(
          (_) => Stream.fromIterable([Loading()]),
        );

        await tester.pumpWidget(getSUT());
        await tester.pump();
        expect(find.byType(LoadingWidget), findsOneWidget);
      });

      testWidgets(
          'when number trivia state is loading should show loading view',
          (tester) async {
        when(mockNumberTriviaBloc.state).thenReturn(
          const Loaded(trivia: tNumberTrivia), // the desired state
        );

        when(mockNumberTriviaBloc.stream).thenAnswer(
          (_) => Stream.fromIterable([const Loaded(trivia: tNumberTrivia)]),
        );

        await tester.pumpWidget(getSUT());
        await tester.pump();
        expect(find.byType(TriviaDisplay), findsOneWidget);
      });

      testWidgets(
          'when number trivia state is loading should show loading view',
          (tester) async {
        when(mockNumberTriviaBloc.state).thenAnswer(
          (_) => const Error(message: ""),
        );

        when(mockNumberTriviaBloc.stream).thenAnswer(
          (_) => Stream.fromIterable([const Error(message: "")]),
        );

        await tester.pumpWidget(getSUT());
        await tester.pump();
        expect(find.byType(MessageDisplay), findsOneWidget);
      });
    },
  );
}
