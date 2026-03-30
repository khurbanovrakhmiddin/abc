import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/request/local/local_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final StorageService storage;
  ThemeCubit(this.storage) : super(storage.getTheme() ? ThemeMode.dark : ThemeMode.light);

  void toggleTheme() {
    final isDark = state == ThemeMode.light;
    storage.setTheme(isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}