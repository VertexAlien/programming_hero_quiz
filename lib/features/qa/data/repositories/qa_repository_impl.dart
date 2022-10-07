import 'package:programming_hero_quiz/core/error/exceptions.dart';
import 'package:programming_hero_quiz/core/network/network_info.dart';
import 'package:programming_hero_quiz/features/qa/data/datasources/qa_local_datasource.dart';
import 'package:programming_hero_quiz/features/qa/data/datasources/qa_remote_datasource.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';
import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:programming_hero_quiz/features/qa/domain/repositories/qa_repository.dart';

class QARepositoryImpl extends QARepository {
  final QARemoteDataSource qaRemoteDataSource;
  final QALocalDataSource qaLocalDataSource;
  final NetworkInfo networkInfo;

  QARepositoryImpl({required this.qaLocalDataSource, required this.qaRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    if (await networkInfo.isConnected) {
      try {
        final questions = await qaRemoteDataSource.getQuestions();
        return Right(questions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveScore({required int score}) async {
    await qaLocalDataSource.saveScore(score: score);
    return const Right(null);
  }
}
