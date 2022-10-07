import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:programming_hero_quiz/features/main_menu/presentation/pages/index.dart';
import 'package:programming_hero_quiz/injection_container.dart' as di;
import 'package:programming_hero_quiz/core/utils/theme.dart';
import 'package:programming_hero_quiz/initial_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: CustomTheme().mainTheme,
      home: const MainMenuScreen(),
    );
  }
}
