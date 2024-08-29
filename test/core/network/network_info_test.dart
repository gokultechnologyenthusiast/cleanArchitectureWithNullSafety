import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockDataConnectionCheaker;

  setUp(() {
    mockDataConnectionCheaker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionCheaker);
  });

  group("isConnected", () {
    test("should forward the call to DataConnectionChecker.hasConnection",
        () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionCheaker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      // act
      final result = networkInfoImpl.isConnected;
      // assert
      verify(mockDataConnectionCheaker.hasConnection).called(1);
      expect(result, tHasConnectionFuture);
    });
  });
}
