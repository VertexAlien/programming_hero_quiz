import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programming_hero_quiz/core/utils/colors.dart';

class CustomTheme {
  ThemeData mainTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColor.pink,
    textTheme: GoogleFonts.sourceSansProTextTheme(
      TextTheme(
        headline2: GoogleFonts.mulish(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: CustomColor.white,
        ),
        headline4: GoogleFonts.mulish(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CustomColor.white,
        ),
        headline5: GoogleFonts.mulish(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CustomColor.white,
        ),
        headline6: GoogleFonts.mulish(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: CustomColor.white,
        ),
        subtitle1: GoogleFonts.mulish(
          fontSize: 14,
          color: CustomColor.white,
        ),
        subtitle2: GoogleFonts.mulish(
          fontSize: 12,
          color: CustomColor.white,
        ),
        bodyText1: GoogleFonts.mulish(
          fontSize: 16,
        ),
        button: GoogleFonts.mulish(
          color: CustomColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
