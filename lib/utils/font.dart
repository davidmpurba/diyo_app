import 'package:diyo/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle? heading1Bold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 48,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading1SemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 48,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading2Bold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading2SemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 34,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading3Bold({
  Color? color = ColorName.textPrimary,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading3SemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading4Bold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 30,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading4SemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading5Bold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? heading5SemiBold({
  Color? color,
  
  TextDecoration? decoration,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
      decoration: decoration,
    ),
  );
}

TextStyle? heading6SemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}


TextStyle? heading6Regular({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? subtitle1({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? subtitle2({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? subtitle3({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 12,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? body1({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? body2({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? captionRegular({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? captionSemiBold({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );
}

TextStyle? body1Underline({
  Color? color,
}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: GoogleFonts.poppins().fontFamily,
      decoration: TextDecoration.underline
    ),
  );
}
