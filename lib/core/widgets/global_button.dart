import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:programming_hero_quiz/core/utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.onPressed,
    this.height = 50,
    this.width = 180,
    this.borderRadius = 15,
    required this.text,
    this.padding,
    this.margin,
    this.style,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final String text;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? CustomColor.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: style ?? Get.textTheme.headline5?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
