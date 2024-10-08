// Mocks generated by Mockito 5.4.4 from annotations
// in clean_architecture_with_nullsafty_new/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i13;
import 'dart:typed_data' as _i15;

import 'package:clean_architecture_with_nullsafty_new/core/error/failure.dart'
    as _i10;
import 'package:clean_architecture_with_nullsafty_new/core/network/network_info.dart'
    as _i20;
import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart'
    as _i6;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_local_datasource.dart'
    as _i18;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart'
    as _i17;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/data/models/number_trivia_model.dart'
    as _i19;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/entities/number_trivia.dart'
    as _i11;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/repositories/number_trivia_repository.dart'
    as _i2;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_conceret_number_trivia.dart'
    as _i4;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/domain/usecases/get_random_number_trivia.dart'
    as _i5;
import 'package:clean_architecture_with_nullsafty_new/features/number_trivia/presentation/bloc/number_trivia_bloc.dart'
    as _i7;
import 'package:dartz/dartz.dart' as _i9;
import 'package:flutter_bloc/flutter_bloc.dart' as _i21;
import 'package:http/http.dart' as _i3;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNumberTriviaRepository_0 extends _i1.SmartFake
    implements _i2.NumberTriviaRepository {
  _FakeNumberTriviaRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_2 extends _i1.SmartFake
    implements _i3.StreamedResponse {
  _FakeStreamedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_3 extends _i1.SmartFake implements Duration {
  _FakeDuration_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_4 extends _i1.SmartFake implements Uri {
  _FakeUri_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetConcreteNumberTrivia_5 extends _i1.SmartFake
    implements _i4.GetConcreteNumberTrivia {
  _FakeGetConcreteNumberTrivia_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetRandomNumberTrivia_6 extends _i1.SmartFake
    implements _i5.GetRandomNumberTrivia {
  _FakeGetRandomNumberTrivia_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInputConverter_7 extends _i1.SmartFake
    implements _i6.InputConverter {
  _FakeInputConverter_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNumberTriviaState_8 extends _i1.SmartFake
    implements _i7.NumberTriviaState {
  _FakeNumberTriviaState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetRandomNumberTrivia].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetRandomNumberTrivia extends _i1.Mock
    implements _i5.GetRandomNumberTrivia {
  MockGetRandomNumberTrivia() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NumberTriviaRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeNumberTriviaRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.NumberTriviaRepository);

  @override
  _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?> call(
          _i5.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?>.value(),
      ) as _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?>);
}

/// A class which mocks [GetConcreteNumberTrivia].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetConcreteNumberTrivia extends _i1.Mock
    implements _i4.GetConcreteNumberTrivia {
  MockGetConcreteNumberTrivia() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NumberTriviaRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeNumberTriviaRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.NumberTriviaRepository);

  @override
  _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?> call(
          _i4.Params? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?>.value(),
      ) as _i8.Future<_i9.Either<_i10.Failure, _i11.NumberTrivia>?>);
}

/// A class which mocks [InputConverter].
///
/// See the documentation for Mockito's code generation for more information.
class MockInputConverter extends _i1.Mock implements _i6.InputConverter {
  MockInputConverter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Either<_i10.Failure, int>? stringToUnsignedInteger(String? str) =>
      (super.noSuchMethod(Invocation.method(
        #stringToUnsignedInteger,
        [str],
      )) as _i9.Either<_i10.Failure, int>?);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i12.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i8.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i3.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i3.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<_i3.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i3.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i14.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i15.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i15.Uint8List>.value(_i15.Uint8List(0)),
      ) as _i8.Future<_i15.Uint8List>);

  @override
  _i8.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i3.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i16.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_3(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);

  @override
  _i8.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<_i16.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i8.Future<_i16.InternetConnectionStatus>.value(
            _i16.InternetConnectionStatus.connected),
      ) as _i8.Future<_i16.InternetConnectionStatus>);

  @override
  _i8.Stream<_i16.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i8.Stream<_i16.InternetConnectionStatus>.empty(),
      ) as _i8.Stream<_i16.InternetConnectionStatus>);
}

/// A class which mocks [Uri].
///
/// See the documentation for Mockito's code generation for more information.
class MockUri extends _i1.Mock implements Uri {
  MockUri() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get scheme => (super.noSuchMethod(
        Invocation.getter(#scheme),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#scheme),
        ),
      ) as String);

  @override
  String get authority => (super.noSuchMethod(
        Invocation.getter(#authority),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#authority),
        ),
      ) as String);

  @override
  String get userInfo => (super.noSuchMethod(
        Invocation.getter(#userInfo),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#userInfo),
        ),
      ) as String);

  @override
  String get host => (super.noSuchMethod(
        Invocation.getter(#host),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#host),
        ),
      ) as String);

  @override
  int get port => (super.noSuchMethod(
        Invocation.getter(#port),
        returnValue: 0,
      ) as int);

  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);

  @override
  String get query => (super.noSuchMethod(
        Invocation.getter(#query),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#query),
        ),
      ) as String);

  @override
  String get fragment => (super.noSuchMethod(
        Invocation.getter(#fragment),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#fragment),
        ),
      ) as String);

  @override
  List<String> get pathSegments => (super.noSuchMethod(
        Invocation.getter(#pathSegments),
        returnValue: <String>[],
      ) as List<String>);

  @override
  Map<String, String> get queryParameters => (super.noSuchMethod(
        Invocation.getter(#queryParameters),
        returnValue: <String, String>{},
      ) as Map<String, String>);

  @override
  Map<String, List<String>> get queryParametersAll => (super.noSuchMethod(
        Invocation.getter(#queryParametersAll),
        returnValue: <String, List<String>>{},
      ) as Map<String, List<String>>);

  @override
  bool get isAbsolute => (super.noSuchMethod(
        Invocation.getter(#isAbsolute),
        returnValue: false,
      ) as bool);

  @override
  bool get hasScheme => (super.noSuchMethod(
        Invocation.getter(#hasScheme),
        returnValue: false,
      ) as bool);

  @override
  bool get hasAuthority => (super.noSuchMethod(
        Invocation.getter(#hasAuthority),
        returnValue: false,
      ) as bool);

  @override
  bool get hasPort => (super.noSuchMethod(
        Invocation.getter(#hasPort),
        returnValue: false,
      ) as bool);

  @override
  bool get hasQuery => (super.noSuchMethod(
        Invocation.getter(#hasQuery),
        returnValue: false,
      ) as bool);

  @override
  bool get hasFragment => (super.noSuchMethod(
        Invocation.getter(#hasFragment),
        returnValue: false,
      ) as bool);

  @override
  bool get hasEmptyPath => (super.noSuchMethod(
        Invocation.getter(#hasEmptyPath),
        returnValue: false,
      ) as bool);

  @override
  bool get hasAbsolutePath => (super.noSuchMethod(
        Invocation.getter(#hasAbsolutePath),
        returnValue: false,
      ) as bool);

  @override
  String get origin => (super.noSuchMethod(
        Invocation.getter(#origin),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.getter(#origin),
        ),
      ) as String);

  @override
  bool isScheme(String? scheme) => (super.noSuchMethod(
        Invocation.method(
          #isScheme,
          [scheme],
        ),
        returnValue: false,
      ) as bool);

  @override
  String toFilePath({bool? windows}) => (super.noSuchMethod(
        Invocation.method(
          #toFilePath,
          [],
          {#windows: windows},
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #toFilePath,
            [],
            {#windows: windows},
          ),
        ),
      ) as String);

  @override
  Uri replace({
    String? scheme,
    String? userInfo,
    String? host,
    int? port,
    String? path,
    Iterable<String>? pathSegments,
    String? query,
    Map<String, dynamic>? queryParameters,
    String? fragment,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replace,
          [],
          {
            #scheme: scheme,
            #userInfo: userInfo,
            #host: host,
            #port: port,
            #path: path,
            #pathSegments: pathSegments,
            #query: query,
            #queryParameters: queryParameters,
            #fragment: fragment,
          },
        ),
        returnValue: _FakeUri_4(
          this,
          Invocation.method(
            #replace,
            [],
            {
              #scheme: scheme,
              #userInfo: userInfo,
              #host: host,
              #port: port,
              #path: path,
              #pathSegments: pathSegments,
              #query: query,
              #queryParameters: queryParameters,
              #fragment: fragment,
            },
          ),
        ),
      ) as Uri);

  @override
  Uri removeFragment() => (super.noSuchMethod(
        Invocation.method(
          #removeFragment,
          [],
        ),
        returnValue: _FakeUri_4(
          this,
          Invocation.method(
            #removeFragment,
            [],
          ),
        ),
      ) as Uri);

  @override
  Uri resolve(String? reference) => (super.noSuchMethod(
        Invocation.method(
          #resolve,
          [reference],
        ),
        returnValue: _FakeUri_4(
          this,
          Invocation.method(
            #resolve,
            [reference],
          ),
        ),
      ) as Uri);

  @override
  Uri resolveUri(Uri? reference) => (super.noSuchMethod(
        Invocation.method(
          #resolveUri,
          [reference],
        ),
        returnValue: _FakeUri_4(
          this,
          Invocation.method(
            #resolveUri,
            [reference],
          ),
        ),
      ) as Uri);

  @override
  Uri normalizePath() => (super.noSuchMethod(
        Invocation.method(
          #normalizePath,
          [],
        ),
        returnValue: _FakeUri_4(
          this,
          Invocation.method(
            #normalizePath,
            [],
          ),
        ),
      ) as Uri);
}

/// A class which mocks [NumberTriviaRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaRemoteDatasource extends _i1.Mock
    implements _i17.NumberTriviaRemoteDatasource {
  MockNumberTriviaRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [NumberTriviaLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaLocalDataSource extends _i1.Mock
    implements _i18.NumberTriviaLocalDataSource {
  MockNumberTriviaLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void>? cacheNumberTrivia(_i19.NumberTriviaModel? triviaToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNumberTrivia,
          [triviaToCache],
        ),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>?);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i20.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [NumberTriviaBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaBloc extends _i1.Mock implements _i7.NumberTriviaBloc {
  MockNumberTriviaBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.GetConcreteNumberTrivia get getConcreteNumberTrivia =>
      (super.noSuchMethod(
        Invocation.getter(#getConcreteNumberTrivia),
        returnValue: _FakeGetConcreteNumberTrivia_5(
          this,
          Invocation.getter(#getConcreteNumberTrivia),
        ),
      ) as _i4.GetConcreteNumberTrivia);

  @override
  _i5.GetRandomNumberTrivia get getRandomNumberTrivia => (super.noSuchMethod(
        Invocation.getter(#getRandomNumberTrivia),
        returnValue: _FakeGetRandomNumberTrivia_6(
          this,
          Invocation.getter(#getRandomNumberTrivia),
        ),
      ) as _i5.GetRandomNumberTrivia);

  @override
  _i6.InputConverter get inputConverter => (super.noSuchMethod(
        Invocation.getter(#inputConverter),
        returnValue: _FakeInputConverter_7(
          this,
          Invocation.getter(#inputConverter),
        ),
      ) as _i6.InputConverter);

  @override
  _i7.NumberTriviaState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeNumberTriviaState_8(
          this,
          Invocation.getter(#state),
        ),
      ) as _i7.NumberTriviaState);

  @override
  _i8.Stream<_i7.NumberTriviaState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i7.NumberTriviaState>.empty(),
      ) as _i8.Stream<_i7.NumberTriviaState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i7.NumberTriviaEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i7.NumberTriviaEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i7.NumberTriviaState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i7.NumberTriviaEvent>(
    _i21.EventHandler<E, _i7.NumberTriviaState>? handler, {
    _i21.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i21.Transition<_i7.NumberTriviaEvent, _i7.NumberTriviaState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i21.Change<_i7.NumberTriviaState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
