import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';

class MyTheme {
  static ThemeData lightThem(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
      splashFactory: InkRipple.splashFactory,
      textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
        bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
      ),
      fontFamily: GoogleFonts.roboto().fontFamily,
    );
  }

  static ThemeData darkThem(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
        splashFactory: InkRipple.splashFactory,
        textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
        scaffoldBackgroundColor: darkBackground);
  }
}
