import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorPrimary = Colors.deepOrangeAccent;
const colorAccent = Colors.orange;
const colorBackgroundDark = Color(0xFF171822);
const colorBackground = Colors.white;
const colorDarkBackground = Colors.black;

const colorBackgroundLight = Color(0xFFF1F3F6);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  scaffoldBackgroundColor: Colors.white,
  cardColor: const Color(0xffF1F3F6),
  iconTheme: const IconThemeData(
    color: Color(0xFF3A4276),
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xff1B1D28),
      fontWeight: FontWeight.w500,
    ),
    bodySmall: GoogleFonts.poppins(
      height: 1.6,
      fontSize: 12,
      color: const Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24,
      color: const Color(0xff171822),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 15,
      color: const Color(0xff3A4276),
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light, // Ensure light brightness
  ).copyWith(
    secondary: colorBackgroundLight,
    surface: colorBackground,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Color(0xff7b7f9e),
  ),
  cardColor: const Color(0xFF212330),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xffffffff),
      fontWeight: FontWeight.w500,
    ),
    bodySmall: GoogleFonts.poppins(
      height: 1.6,
      fontSize: 12,
      color: const Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24,
      color: const Color(0xFFFFFFFF),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark, // Ensure dark brightness
  ).copyWith(
    secondary: colorBackgroundDark,
    surface: colorDarkBackground,
  ),
);
