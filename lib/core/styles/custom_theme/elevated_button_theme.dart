import 'package:flutter/material.dart';

import '../colors.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      foregroundColor: whiteColor,
      backgroundColor: mainPrimaryGreenColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: mainPrimaryGreenColor),
      padding: const EdgeInsets.symmetric(horizontal: 64,vertical: 8),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(),
        backgroundColor: Color(0xFF15B86C),
        foregroundColor:Color(0xFFFFFCFC),
        fixedSize: Size(343, 40),)
  );
}