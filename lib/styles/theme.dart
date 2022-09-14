import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

final ThemeData theme = ThemeData(
    textTheme: GoogleFonts.nunitoTextTheme(),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: colorBlack),
        backgroundColor: colorBgPage,
        elevation: 0,
        titleTextStyle: textStyleGoogle.copyWith(color: colorBlack)));
