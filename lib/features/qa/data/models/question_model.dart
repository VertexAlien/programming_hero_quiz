import 'package:json_annotation/json_annotation.dart';
import 'package:programming_hero_quiz/features/qa/data/models/answer_model.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/answer.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel extends Question {
  const QuestionModel({
    required String question,
    required AnswerModel answers,
    required String? questionImageUrl,
    required String correctAnswer,
    required int score,
  }) : super(
          question: question,
          answers: answers,
          questionImageUrl: questionImageUrl,
          correctAnswer: correctAnswer,
          score: score,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
