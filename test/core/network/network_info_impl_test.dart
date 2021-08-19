import 'package:clean_architecture_reso/features/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_impl_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  var mockInternetConnectionChecker = MockInternetConnectionChecker();
  NetworkInfoImpl? networkInfoImpl;

  setUp(() {
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test("should forward the call to DataConnection.hasConnection", () async {
      var tHasConnection = Future.value(true);
      // arrange
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((realInvocation) => tHasConnection);
      // act
      final result = networkInfoImpl!.isConnected;
      // assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
