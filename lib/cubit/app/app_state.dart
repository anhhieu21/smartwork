part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppTheme extends AppState {
  final ThemeData theme;
  final bool isDark;
  const AppTheme(
    this.theme,this.isDark
  );

  @override
  List<Object> get props => [theme];
}
