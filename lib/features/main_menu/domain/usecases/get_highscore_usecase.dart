import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/core/usecase/usecase.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/repositories/mainmenu_repository.dart';

class GetHighScoreUsecase implements UseCase<int?, void> {
  final MainMenuRepository repository;

  GetHighScoreUsecase({required this.repository});

  @override
  Future<Either<Failure, int?>> call(void params) {
    return repository.getHighScore();
  }
}
