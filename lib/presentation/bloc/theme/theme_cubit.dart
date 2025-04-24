import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/theme/app_theme.dart';


class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme);

  bool _isDark = false;

  bool get isDarkMode => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    emit(_isDark ? AppTheme.darkTheme : AppTheme.lightTheme);
  }
}