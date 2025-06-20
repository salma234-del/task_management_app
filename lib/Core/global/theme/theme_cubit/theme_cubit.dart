import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/theme_pref.dart';
import 'package:task_management_app/Core/global/theme/theme_cubit/theme_state.dart';
import 'package:task_management_app/Core/services/local_storage_service.dart';
import 'package:task_management_app/Core/utils/app_constants.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = AppConstants.themeKey;
  final LocalStorageService<String> _storageService;

  ThemeCubit(this._storageService) : super(const ThemeState(themeMode: ThemeMode.light));

  Future<void> loadTheme() async {
    final stored = await _storageService.get(_themeKey);
    final pref = ThemePrefExtension.fromString(stored);
    emit(ThemeState(themeMode: pref.themeMode));
  }

  Future<void> toggleTheme() async {
    final newPref = state.themeMode == ThemeMode.light ? ThemePref.dark : ThemePref.light;

    await _storageService.save(_themeKey, newPref.name);
    emit(ThemeState(themeMode: newPref.themeMode));
  }

  Future<void> setTheme(ThemePref pref) async {
    await _storageService.save(_themeKey, pref.name);
    emit(ThemeState(themeMode: pref.themeMode));
  }
}
