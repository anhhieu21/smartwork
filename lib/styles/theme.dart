import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class ThemeApp {
  static ThemeApp themeApp = ThemeApp();
  ThemeApp();

  final ThemeData theme = ThemeData.light().copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: colorBlack),
          elevation: 0,
          titleTextStyle: textStyleGoogle.copyWith(color: colorBlack)));
  final ThemeData darkMode = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: colorBlack),
          elevation: 0,
          titleTextStyle: textStyleGoogle));
}
