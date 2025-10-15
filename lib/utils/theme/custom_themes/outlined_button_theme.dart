import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  ///Light Outlined Button Theme
  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.dark,
      side: const BorderSide(color: TColors.dark),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.dark,),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  ///Dark Outlined Button Theme
  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.white,
      side: const BorderSide(color: TColors.white),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.white,),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}