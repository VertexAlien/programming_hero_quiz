import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:programming_hero_quiz/features/main_menu/domain/usecases/get_highscore_usecase.dart';

class MainMenuController extends GetxController {
  final GetHighScoreUsecase getHighScoreUsecase;

  MainMenuController({required this.getHighScoreUsecase});

  RxInt highscore = 0.obs;

  getHighScore() async {
    final result = await getHighScoreUsecase.call(null);

    result.fold((l) => null, (r) => highscore.value = r ?? 0);
  }

  @override
  void onInit() {
    getHighScore();
    super.onInit();
  }
}
