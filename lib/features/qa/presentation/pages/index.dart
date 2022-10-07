import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:programming_hero_quiz/core/utils/colors.dart';
import 'package:programming_hero_quiz/core/widgets/global_button.dart';
import 'package:programming_hero_quiz/features/qa/presentation/controller/controller.dart';

class QAScreen extends GetView<QAController> {
  const QAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              )
            : SafeArea(
                child: ListView(
                  children: [
                    // const SizedBox(height: 20),
                    LinearPercentIndicator(
                      width: Get.width,
                      lineHeight: 40,
                      percent: controller.percent.value,
                      // animation: true,
                      // animationDuration: 10000,
                      // onAnimationEnd: () => controller.onEnd(),
                      // restartAnimation: controller.restartAnimation.value,
                      progressColor: CustomColor.primaryColor,
                      backgroundColor: CustomColor.green,
                      padding: EdgeInsets.zero,
                    ),
                    Container(
                      color: Colors.white,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Question: ${controller.currentQuestionIndex + 1}/${controller.questions.length}',
                            style: Get.textTheme.headline4?.copyWith(color: CustomColor.primaryColor),
                          ),
                          Text(
                            'Score: ${controller.score}',
                            style: Get.textTheme.headline4?.copyWith(color: CustomColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${controller.questions[controller.currentQuestionIndex].score} Point',
                            style: Get.textTheme.headline4?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          if (controller.questions[controller.currentQuestionIndex].questionImageUrl != null)
                            CachedNetworkImage(
                              imageUrl: controller.questions[controller.currentQuestionIndex].questionImageUrl!,
                              progressIndicatorBuilder: (context, url, progress) {
                                return GFShimmer(
                                  mainColor: CustomColor.grey2,
                                  child: Container(
                                    height: 250,
                                    width: double.infinity,
                                    color: CustomColor.grey2,
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  height: 250,
                                  width: double.infinity,
                                  color: CustomColor.grey2,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Image could not load',
                                    style: Get.textTheme.headline2,
                                  ),
                                );
                              },
                            ),

                          // Image.network(
                          //   controller.questions[controller.currentQuestionIndex].questionImageUrl!,
                          // ),
                          Text(
                            controller.questions[controller.currentQuestionIndex].question,
                            style: Get.textTheme.headline4?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        if (controller.questions[controller.currentQuestionIndex].answers.a != null)
                          GlobalButton(
                            backgroundColor: controller.isShowingAnswer.value
                                ? controller.correctAnswer == 'A'
                                    ? Colors.green
                                    : Colors.red
                                : Colors.white,
                            width: Get.width / 1.4,
                            onPressed: () {
                              controller.processAnswer(answer: 'A');
                            },
                            text: controller.questions[controller.currentQuestionIndex].answers.a!,
                          ),
                        const SizedBox(height: 10),
                        if (controller.questions[controller.currentQuestionIndex].answers.b != null)
                          GlobalButton(
                            backgroundColor: controller.isShowingAnswer.value
                                ? controller.correctAnswer == 'B'
                                    ? CustomColor.green
                                    : Colors.red
                                : Colors.white,
                            width: Get.width / 1.4,
                            onPressed: () {
                              controller.processAnswer(answer: 'B');
                            },
                            text: controller.questions[controller.currentQuestionIndex].answers.b!,
                          ),
                        const SizedBox(height: 10),
                        if (controller.questions[controller.currentQuestionIndex].answers.c != null)
                          GlobalButton(
                            backgroundColor: controller.isShowingAnswer.value
                                ? controller.correctAnswer == 'C'
                                    ? Colors.green
                                    : Colors.red
                                : Colors.white,
                            width: Get.width / 1.4,
                            onPressed: () {
                              controller.processAnswer(answer: 'C');
                            },
                            text: controller.questions[controller.currentQuestionIndex].answers.c!,
                          ),
                        const SizedBox(height: 10),
                        if (controller.questions[controller.currentQuestionIndex].answers.d != null)
                          GlobalButton(
                            backgroundColor: controller.isShowingAnswer.value
                                ? controller.correctAnswer == 'D'
                                    ? Colors.green
                                    : Colors.red
                                : Colors.white,
                            width: Get.width / 1.4,
                            onPressed: () {
                              controller.processAnswer(answer: 'D');
                            },
                            text: controller.questions[controller.currentQuestionIndex].answers.d!,
                          ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
      ),
    );
  }
}
