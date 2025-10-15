/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_store/utils/constants/colors.dart';

/* -- Light & Dark Text Themes -- */
class TTextTheme {
  TTextTheme._(); //To avoid creating instances

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: TColors.dark),
    displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: TColors.dark),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: TColors.dark),
    headlineMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.dark),
    headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: TColors.dark),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.dark),
    titleSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.dark),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: TColors.dark),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, color: TColors.dark.withValues(alpha: 0.8)),
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: TColors.white),
    titleSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.white),
    displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: TColors.white),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: TColors.white),
    headlineMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
    headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: TColors.white),
    titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.white),
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, color: TColors.white),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, color: TColors.white.withValues(alpha: 0.8)),
  );
}*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    // DISPLAY (Used rarely - Very Large)
    displayLarge: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: TColors.dark),
    displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: TColors.dark),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: TColors.dark),

    // HEADLINES (Page titles, section headers)
    headlineLarge: GoogleFonts.poppins(fontSize: 22.0, fontWeight: FontWeight.w600, color: TColors.dark), // NEW
    headlineMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.dark),
    headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: TColors.dark),

    // TITLES (Cards, AppBar titles, smaller headings)
    titleLarge: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.dark),
    titleMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.dark), // NEW
    titleSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.dark),

    // BODY (Paragraphs, product descriptions)
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColors.dark),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColors.dark.withValues(alpha: 0.8)),
    bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.dark.withValues(alpha: 0.7)), // NEW

    // LABELS (Buttons, Chips, Small text)
    labelLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.dark), // NEW
    labelMedium: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.dark), // NEW
    labelSmall: GoogleFonts.poppins(fontSize: 10.0, fontWeight: FontWeight.w400, color: TColors.dark.withValues(alpha: 0.7)), // NEW
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = TextTheme(
    // DISPLAY
    displayLarge: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.bold, color: TColors.white),
    displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: TColors.white),
    displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.normal, color: TColors.white),

    // HEADLINES
    headlineLarge: GoogleFonts.poppins(fontSize: 22.0, fontWeight: FontWeight.w600, color: TColors.white), // NEW
    headlineMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
    headlineSmall: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold, color: TColors.white),

    // TITLES
    titleLarge: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.white),
    titleMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.white), // NEW
    titleSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.white),

    // BODY
    bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColors.white),
    bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: TColors.white.withValues(alpha: 0.8)),
    bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w400, color: TColors.white.withValues(alpha: 0.7)), // NEW

    // LABELS
    labelLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.white), // NEW
    labelMedium: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.white), // NEW
    labelSmall: GoogleFonts.poppins(fontSize: 10.0, fontWeight: FontWeight.w400, color: TColors.white.withValues(alpha: 0.7)), // NEW
  );
}
