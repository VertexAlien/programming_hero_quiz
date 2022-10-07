import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';

abstract class QARepository {
  Future<Either<Failure, List<Question>>> getQuestions();
  Future<Either<Failure, void>> saveScore({required int score});
}
