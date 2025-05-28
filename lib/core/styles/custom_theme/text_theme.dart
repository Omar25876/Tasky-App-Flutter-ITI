import 'package:flutter/material.dart';

import '../colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 18.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black.withOpacity(0.5),
    ),
    labelSmall: const TextStyle().copyWith(
      fontFamily: "Montserrat",
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),

    titleLarge: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: "Circular Std",
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: whiteColor,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: whiteColor,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: whiteColor,
    ),
  );
}
