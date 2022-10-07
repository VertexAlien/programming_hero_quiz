import 'dart:convert';

import 'package:programming_hero_quiz/core/error/exceptions.dart';
import 'package:programming_hero_quiz/core/network/rest_client_service.dart';
import 'package:programming_hero_quiz/features/qa/data/models/question_model.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';

abstract class QARemoteDataSource {
  Future<List<Question>> getQuestions();
}

class QARemoteDataSourceImpl extends QARemoteDataSource {
  final RestClientService restClientService;

  QARemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<Question>> getQuestions() async {
    final response = await restClientService.getQuestions();

    if (response.statusCode != 200) throw ServerException();

    return List.from(json.decode(response.body)["questions"].map((x) => QuestionModel.fromJson(x)));
  }
}
