import 'package:flutter/material.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

final ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: colorBlack),
        backgroundColor: colorBgPage,
        elevation: 0,
        titleTextStyle: textStyleGoogle.copyWith(color: colorBlack)));
