import 'package:get/get.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/usecases/get_highscore_usecase.dart';
import 'package:programming_hero_quiz/features/main_menu/presentation/controller/controller.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/get_questions_usecase.dart';
import 'package:programming_hero_quiz/features/qa/domain/usecases/save_score_usecase.dart';
import 'package:programming_hero_quiz/features/qa/presentation/controller/controller.dart';
import 'package:programming_hero_quiz/injection_container.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAController>(() => QAController(getQuestionsUseCase: sl<GetQuestionsUseCase>(), saveScoreUsecase: sl<SaveScoreUsecase>()));
    Get.lazyPut<MainMenuController>(() => MainMenuController(getHighScoreUsecase: sl<GetHighScoreUsecase>()));
  }
}
