import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(DarkModeInitial());

  void themeMode({required bool value})async{
      await SaveThemeMode.setTheme(themeDarkOrLight: value);  
      if (value == true) {
        emit(DarkModeTheme());
      }  else{
        emit(LightModeTheme());
      }
  }
}
