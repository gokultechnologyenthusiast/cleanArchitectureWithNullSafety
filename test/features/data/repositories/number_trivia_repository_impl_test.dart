import 'package:clean_architecture_reso/features/core/error/exceptions.dart';
import 'package:clean_architecture_reso/features/core/error/failures.dart';
import 'package:clean_architecture_reso/features/core/network/network_info.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_reso/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_reso/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks(
    [NumberTriviaRemoteDataSource, NumberTriviaLocalDataSource, NetworkInfo])
void main() {
  final mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
  final mockLocalDataSource = MockNumberTriviaLocalDataSource();
  final mockNetworkInfo = MockNetworkInfo();
  NumberTriviaRepositoryImpl? repository;

  setUp(() {
    repository = NumberTriviaRepositoryImpl(
      numberTriviaRemoteDataSource: mockRemoteDataSource,
      numberTriviaLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestOnline(Function body) {
    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });

      body();
    });
  }

  group('Get concrete number trivia', () {
    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel(text: "test", number: tNumber);
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test("should check if the device is online", () async {
      // arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockRemoteDataSource.getConcreteNumberTrivia(any))
          .thenAnswer((realInvocation) async => tNumberTriviaModel);
      // act
      await repository!.getConcreteNumberTrivia(tNumber);
      // assert
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    });

    runTestOnline(() {
      test(
          "should return remote data when the call to remote data source is "
          "successful", () async {
        // arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(any))
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        final result = await repository!.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tNumberTrivia)));
      });

      test(
          "should cache the data locally when the call to remote data source "
          "is successful", () async {
        // arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(any))
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        await repository!.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
      });

      test(
          "should return server failure when the call to remote data source is "
          "unsuccessful", () async {
        // arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(any))
            .thenThrow(ServerException());
        // act
        final result = await repository!.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verifyNever(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOffline(() {
      test(
          "should return last locally cached data when the cached data is "
          "present", () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        final result = await repository!.getConcreteNumberTrivia(tNumber);
        // assert
        verifyNever(mockRemoteDataSource.getConcreteNumberTrivia(any));
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));
      });

      test(
          "should return CacheFailure when the no cached data is "
          "present", () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());
        // act
        final result = await repository!.getConcreteNumberTrivia(tNumber);
        // assert
        verifyNever(mockRemoteDataSource.getConcreteNumberTrivia(any));
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('Get random number trivia', () {
    final tNumberTriviaModel = NumberTriviaModel(text: "test", number: 1);
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test("should check if the device is online", () async {
      // arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
      when(mockRemoteDataSource.getRandomNumberTrivia())
          .thenAnswer((realInvocation) async => tNumberTriviaModel);
      // act
      await repository!.getRandomNumberTrivia();
      // assert
      verify(mockRemoteDataSource.getRandomNumberTrivia());
      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test(
          "should return remote data when the call to remote data source is "
          "successful", () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        final result = await repository!.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));
      });

      test(
          "should cache the data locally when the call to remote data source "
          "is successful", () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        await repository!.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
      });

      test(
          "should return server failure when the call to remote data source is "
          "unsuccessful", () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenThrow(ServerException());
        // act
        final result = await repository!.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verifyNever(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOffline(() {
      test(
          "should return last locally cached data when the cached data is "
          "present", () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((realInvocation) async => tNumberTriviaModel);
        // act
        final result = await repository!.getRandomNumberTrivia();
        // assert
        verifyNever(mockRemoteDataSource.getRandomNumberTrivia());
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));
      });

      test(
          "should return CacheFailure when the no cached data is "
          "present", () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());
        // act
        final result = await repository!.getRandomNumberTrivia();
        // assert
        verifyNever(mockRemoteDataSource.getRandomNumberTrivia());
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
