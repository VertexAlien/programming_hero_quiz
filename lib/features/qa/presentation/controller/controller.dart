import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_hero_quiz/core/error/failures.dart';
import 'package:programming_hero_quiz/features/main_menu/presentation/controller/controller.dart';
import 'package:programming_hero_quiz/features/qa/domain/entities/question.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/get_questions_usecase.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/save_score_usecase.dart';

class QAController extends GetxController {
  final GetQuestionsUseCase getQuestionsUseCase;
  final SaveScoreUsecase saveScoreUsecase;

  QAController({required this.getQuestionsUseCase, required this.saveScoreUsecase});

  List<Question> questions = [];

  int currentQuestionIndex = 0;

  RxBool isLoading = false.obs;
  RxBool isShowingAnswer = false.obs;

  String correctAnswer = 'A';

  int score = 0;

  RxBool restartAnimation = false.obs;
  RxDouble percent = 0.0.obs;
  static double timeInSec = 10;

  Timer? timer;

  startTimer() {
    timeInSec = 10;
    percent.value = 0.0;

    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (timeInSec > 0) {
        timeInSec -= 0.001;

        if (isShowingAnswer.value) {
          percent.value = 1.0;
          timer.cancel();
        }

        if (percent.value < 1) {
          percent.value += 0.001;
        } else {
          percent.value = 1.0;
          timer.cancel();
          onEnd();
        }
      } else {
        percent.value = 0.0;
        timer.cancel();
      }
    });
  }

  onEnd() {
    if (isShowingAnswer.value) {
      return;
    }

    processAnswer(answer: 'E');
  }

  processAnswer({required String answer}) {
    if (isShowingAnswer.value) {
      return;
    }
    correctAnswer = questions[currentQuestionIndex].correctAnswer;

    if (answer == correctAnswer) {
      score += questions[currentQuestionIndex].score;
    }

    isShowingAnswer.value = true;

    nextQuestion();
  }

  nextQuestion() async {
    await Future.delayed(const Duration(seconds: 2));

    if (currentQuestionIndex + 1 == questions.length) {
      await saveScoreUsecase.call(score);
      Get.find<MainMenuController>().getHighScore();
      Get.snackbar('Your Score: $score', 'Your last quiz\'s result', colorText: Colors.white);
      Get.until((route) => route.isFirst);
    }

    currentQuestionIndex += 1;

    isShowingAnswer.value = false;
    startTimer();
  }

  Future<void> getQuestions() async {
    isLoading.value = true;

    final result = await getQuestionsUseCase(null);

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar('No connection', 'Please check your internet connection');
        } else {
          Get.snackbar('Server error', 'Please try again later');
        }
      },
      (r) {
        questions = r;
      },
    );

    isLoading.value = false;
  }

  @override
  void onInit() {
    getQuestions();
    startTimer();
    super.onInit();
  }
}
