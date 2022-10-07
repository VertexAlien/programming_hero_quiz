import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:programming_hero_quiz/core/utils/colors.dart';
import 'package:programming_hero_quiz/core/widgets/global_button.dart';
import 'package:programming_hero_quiz/features/main_menu/presentation/controller/controller.dart';
import 'package:programming_hero_quiz/features/qa/presentation/pages/index.dart';
import 'package:programming_hero_quiz/initial_binding.dart';

class MainMenuScreen extends GetView<MainMenuController> {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png'),
            Text(
              'QUIZ',
              style: Get.textTheme.headline2?.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Highscore',
              style: Get.textTheme.headline4,
            ),
            const SizedBox(height: 5),
            Obx(
              () => Text(
                controller.highscore == null ? 'Please play to get highscore!' : '${controller.highscore} Points',
                style: Get.textTheme.headline5,
              ),
            ),
            const SizedBox(height: 70),
            GlobalButton(
              text: 'START',
              onPressed: () {
                Get.to(() => const QAScreen(), binding: InitialBinding());
              },
            )
          ],
        ),
      ),
    );
  }
}
