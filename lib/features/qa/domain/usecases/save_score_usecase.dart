import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/core/usecase/usecase.dart';
import 'package:programming_hero_quiz/features/qa/domain/repositories/qa_repository.dart';

class SaveScoreUsecase implements UseCase<void, int> {
  final QARepository repository;

  SaveScoreUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(int params) {
    return repository.saveScore(score: params);
  }
}
