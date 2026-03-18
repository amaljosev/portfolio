part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;

  const ThemeState({
    required this.isDark,
    required this.themeData,
  });

  @override
  List<Object> get props => [isDark];
}