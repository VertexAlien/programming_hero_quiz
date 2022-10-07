// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      question: json['question'] as String,
      answers: AnswerModel.fromJson(json['answers'] as Map<String, dynamic>),
      questionImageUrl: json['questionImageUrl'] as String?,
      correctAnswer: json['correctAnswer'] as String,
      score: json['score'] as int,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'questionImageUrl': instance.questionImageUrl,
      'correctAnswer': instance.correctAnswer,
      'score': instance.score,
    };
