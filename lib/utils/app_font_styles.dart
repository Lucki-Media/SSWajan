import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppFontStyles {
  static const String arvo = 'Arvo';

  static TextStyle headlineLarge() {
    return TextStyle(
        fontFamily: arvo,
        color: AppColors.kYellow,
        fontWeight: FontWeight.w700,
        fontSize: 25,
    );
  }
  static TextStyle headlineMedium() {
    return const TextStyle(
      fontFamily: arvo,
      color: AppColors.kOffWhite,
      fontWeight: FontWeight.w700,
      fontSize: 15.5,
    );
  }
  // static TextStyle headlineSmall() {
  //   return const TextStyle(
  //       fontFamily: arvo,
  //       color: AppColors.kPurple,
  //       fontWeight: FontWeight.w800,
  //       fontSize: 20,
  //       height: 1
  //   );
  // }
  //
  static TextStyle bodyLarge() {
    return  TextStyle(
        fontFamily: arvo,
        color: AppColors.kBlack,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        height: 1.2
    );
  }
  static TextStyle bodyMedium({Color color = AppColors.kGrey
  }) {
    return  TextStyle(
        fontFamily: arvo,
        color:color,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1
    );
  }
  // static TextStyle bodySmall({required Color color}) {
  //   return TextStyle(
  //     fontFamily: baloo2,
  //     color: color,
  //     fontWeight: FontWeight.w500,
  //     fontSize: 12,
  //   );
  // }
  //
}