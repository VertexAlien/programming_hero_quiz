import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Answer extends Equatable {
  const Answer({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  @JsonKey(name: 'A')
  final String? a;
  @JsonKey(name: 'B')
  final String? b;
  @JsonKey(name: 'C')
  final String? c;
  @JsonKey(name: 'D')
  final String? d;

  @override
  List<Object?> get props => [a, b, c, d];
}
