part of 'theme_mode_cubit.dart';

sealed class ThemeModeState extends Equatable {
  const ThemeModeState();

  @override
  List<Object> get props => [];
}

final class DarkModeInitial extends ThemeModeState {}

final class DarkModeTheme extends ThemeModeState{}

final class LightModeTheme extends ThemeModeState{
}
