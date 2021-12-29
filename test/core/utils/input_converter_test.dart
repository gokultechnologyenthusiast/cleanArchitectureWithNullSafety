import 'package:clean_architecture_with_nullsafty_new/core/error/failure.dart';
import 'package:clean_architecture_with_nullsafty_new/core/utils/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group("stringToUnsignedInteger", () {
    test(
        "should return an integer when the string represents an unsigned integer",
        () async {
      // arrange
      const str = "123";
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, const Right(123));
    });

    test("should return a Failure when the string is not an integer", () async {
      // arrange
      const str = "abc";
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });

    test("should return a Failure when the string is a negetive integer",
        () async {
      // arrange
      const str = "-123";
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
