import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/core/error/failures.dart';

abstract class MainMenuRepository {
  Future<Either<Failure, int?>> getHighScore();
}
