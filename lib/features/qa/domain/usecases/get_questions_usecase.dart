import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/core/usecase/usecase.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';
import 'package:programming_hero_quiz/features/qa/domain/repositories/qa_repository.dart';

class GetQuestionsUseCase implements UseCase<List<Question>, void> {
  final QARepository repository;

  GetQuestionsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Question>>> call(void params) {
    return repository.getQuestions();
  }
}
