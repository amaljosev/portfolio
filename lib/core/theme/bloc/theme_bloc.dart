import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(isDark: true, themeData: AppTheme.dark)) {
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final newIsDark = !state.isDark;
    emit(ThemeState(
      isDark: newIsDark,
      themeData: newIsDark ? AppTheme.dark : AppTheme.light,
    ));
  }
}