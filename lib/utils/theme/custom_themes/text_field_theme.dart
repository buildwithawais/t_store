import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextFormFieldTheme  {
  TTextFormFieldTheme._();

  /// Light Text Field Theme
    static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: TColors.darkGrey,
      suffixIconColor: TColors.darkGrey,
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: TColors.dark, fontWeight: FontWeight.bold),
      hintStyle: const TextStyle().copyWith(fontSize: 14, color: TColors.dark),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle: const TextStyle().copyWith(color: TColors.dark.withValues(alpha: 0.8)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.darkGrey),
      ),
      enabledBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.darkGrey),
      ),
      focusedBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.black12),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 2, color: TColors.warning),
      ),
    );

  /// Dark Text Theme Field
    static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: TColors.grey,
      suffixIconColor: TColors.grey,
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: TColors.white, fontWeight: FontWeight.bold),
      hintStyle: const TextStyle().copyWith(fontSize: 14, color: TColors.white),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle: const TextStyle().copyWith(color: TColors.white.withValues(alpha: 0.8)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.grey),
      ),
      enabledBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.grey),
      ),
      focusedBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.white),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: TColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 2, color: TColors.warning),
      ),
    );
}