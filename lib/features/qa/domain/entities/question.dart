// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:programming_hero_quiz/features/qa/data/models/answer_model.dart';
import 'dart:convert';

import 'package:programming_hero_quiz/features/qa/domain/entities/answer.dart';

class Question extends Equatable {
  const Question({
    required this.question,
    required this.answers,
    required this.questionImageUrl,
    required this.correctAnswer,
    required this.score,
  });

  final String question;
  final AnswerModel answers;
  final String? questionImageUrl;
  final String correctAnswer;
  final int score;

  @override
  List<Object?> get props => [question, answers, questionImageUrl, correctAnswer, score];
}
