import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/presentation/styles/theme.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  darkMode(bool isDarkMode) {
    final ThemeData theme;
    if (isDarkMode) {
      theme = ThemeApp.themeApp.darkMode;
    } else {
      theme = ThemeApp.themeApp.theme;
    }
    emit(AppTheme(theme, isDarkMode));
  }
}
