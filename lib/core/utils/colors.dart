import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = Color(0xff02012c);
  static const Color secondaryColor = Color(0xff15BE77);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xff333333);
  static const Color grey = Color(0xffF7F5FA);
  static const Color grey2 = Color(0xffBDBDBD);
  static const Color grey3 = Color(0x4dC4C4C4);
  static const Color grey4 = Color(0xff828282);
  static const Color pink = Color(0xffF76E87);
  static const Color blue = Color(0xff2F80ED);
  static const Color skyBlue = Color(0xff3AA8F8);
  static const Color blue2 = Color(0xff3F98CB);
  static const Color purple = Color(0xff7639C3);
  static const Color limegreen = Color(0xff8FC339);
  static const Color pastal = Color(0xff007F7B);
  static const Color green = Color(0xff39C381);
  static const Color orange = Color(0xffFEAD1D);
  static Color orangeLight = const Color(0xffF9A84D).withOpacity(0.1);
  static const Color orangeDark = Color(0xffDA6317);

  static const LinearGradient greenGradient = LinearGradient(colors: [
    CustomColor.primaryColor,
    CustomColor.secondaryColor,
  ]);

  static List<BoxShadow> blueShadow = [
    BoxShadow(
      color: Colors.blueAccent.withOpacity(0.1),
      spreadRadius: 10,
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}
