import 'package:shared_preferences/shared_preferences.dart';

abstract class MainMenuLocalDataSource {
  Future<int?> getHighScore();
}

class MainMenuLocalDataSourceImpl extends MainMenuLocalDataSource {
  @override
  Future<int?> getHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? highscore = prefs.getInt('highscore');

    return highscore;
  }
}
