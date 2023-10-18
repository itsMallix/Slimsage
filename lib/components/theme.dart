import 'package:flutter/material.dart';

class DesignSystem {
  DesignSystem._();
  static const Color mainGreen = Color(0xff91C788);
  static const Color secondGreen = Color(0xffEFF7EE);
  static const Color mainRed = Color(0xffFF8473);
  static const Color secondRed = Color(0xffFFC0B8);
  static const Color mainBlue = Color(0xff8680D4);
  static const Color secondBlue = Color(0xffA3A0CA);
  static const Color mainYellow = Color(0xffFFCD62);
  static const Color secondYellow = Color(0xffFFF8EB);

  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff2a2a2a);
  static const Color grey = Color(0xffF4F4F4);
  static const Color maingrey = Color(0xff999999);

  static const TextTheme textTheme = TextTheme(
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: black,
    height: 1.2,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.27,
    color: black,
    height: 1.2,
  );
  static const TextStyle headlineMediumWhite = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.27,
    color: white,
    height: 1.2,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.27,
    color: black,
    height: 1.2,
  );
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle bodyMediumCustom = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w600,
    fontSize: 15,
    letterSpacing: 0.18,
    color: mainGreen,
    height: 1.2,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'CeraRoundPro',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.18,
    color: black,
    height: 1.2,
  );
}
