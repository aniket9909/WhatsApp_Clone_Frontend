import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidget {
  static getTextStyle(double fontSize, FontWeight fontWeight, Color color,
      BuildContext context) {
    return GoogleFonts.roboto(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
