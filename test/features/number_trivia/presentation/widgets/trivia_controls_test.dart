import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart';
import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/widgets/trivia_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class MockNumberTriviaBloc
    extends MockBloc<NumberTriviaEvent, NumberTriviaState>
    implements NumberTriviaBloc {}

final sl = GetIt.instance;

void main() {
  late MockNumberTriviaBloc mockNumberTriviaBloc;
  Widget getSUT() {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => sl<NumberTriviaBloc>(),
        child: const Scaffold(body: TriviaControls()),
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
      sl.registerSingleton<http.Client>(MockHttpClient());
      sl.registerSingleton<InternetConnectionChecker>(
          MockInternetConnectionChecker());
    },
  );
  testWidgets('trivia controls ...', (tester) async {
    await tester.pumpWidget(getSUT());
    await tester.pump();
    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), "1");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.byKey(const Key("ElevatedButtonRemote")), findsOneWidget);
    await tester.tap(find.byKey(const Key("ElevatedButtonRemote")));
    await tester.pump();
  });
}
