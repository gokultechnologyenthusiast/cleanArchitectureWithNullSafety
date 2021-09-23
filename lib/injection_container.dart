import 'package:clean_architecture_reso/features/core/network/network_info.dart';
import 'package:clean_architecture_reso/features/core/util/input_converter.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  /// Features - Number Trivia
  // bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  );

  // use cases
  sl.registerLazySingleton(
    () => GetConcreteNumberTrivia(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetRandomNumberTrivia(
      sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      numberTriviaRemoteDataSource: sl(),
      numberTriviaLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  /// Core
  sl.registerLazySingleton(
    () => InputConverter(),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
