import 'package:shared_preferences/shared_preferences.dart';

abstract class QALocalDataSource {
  Future<void> saveScore({required int score});
}

class QALocalDataSourceImpl extends QALocalDataSource {
  @override
  Future<void> saveScore({required int score}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? highscore = prefs.getInt('highscore');

    if (highscore == null) {
      prefs.setInt('highscore', score);
      return;
    }

    if (highscore < score) {
      prefs.setInt('highscore', score);
      return;
    }
  }
}
