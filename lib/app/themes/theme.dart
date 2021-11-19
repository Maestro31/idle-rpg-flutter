import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColors {
  static get darkBrown => const Color(0xFF362C25);
  static get extraDarkBrown => const Color(0xFF362C26);
  static get lightBrown1 => const Color(0xFFEBE0D6);
  static get lightBrown2 => const Color(0xFF8C7668);
  static get lightBrown3 => const Color(0xFFDCD0CA);
}

class CustomThemeData {
  final ThemeData authTheme;

  CustomThemeData({
    required this.authTheme,
  });

  factory CustomThemeData.lightTheme() => CustomThemeData(
          authTheme: ThemeData(
        textTheme: const TextTheme(
            headline3: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        )),
      ));
}

extension CustomTheme on ThemeData {
  CustomThemeData get custom => CustomThemeData.lightTheme();
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: CustomColors.darkBrown,
    );
  }
}
