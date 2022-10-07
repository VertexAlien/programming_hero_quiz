import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/features/main_menu/data/datasources/mainmenu_local_datasource.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/repositories/mainmenu_repository.dart';

class MainMenuRepositoryImpl extends MainMenuRepository {
  final MainMenuLocalDataSource localDataSource;

  MainMenuRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, int?>> getHighScore() async {
    final highscore = await localDataSource.getHighScore();

    return Right(highscore);
  }
}
