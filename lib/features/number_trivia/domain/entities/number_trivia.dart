import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  const NumberTrivia({
    required this.text,
    required this.number,
  });

  final int number;
  final String text;

  @override
  List<Object?> get props => [
        text,
        number,
      ];
}
