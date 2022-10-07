import 'package:json_annotation/json_annotation.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/answer.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel extends Answer {
  const AnswerModel({
    required String? a,
    required String? b,
    required String? c,
    required String? d,
  }) : super(
          a: a,
          b: b,
          c: c,
          d: d,
        );

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
