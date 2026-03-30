import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/request/local/local_storage.dart';

class LanguageCubit extends Cubit<Locale> {
  final StorageService storage;

  LanguageCubit(this.storage) : super(Locale(storage.getLanguage()));

  void changeLanguage(String code) {
    storage.setLanguage(code);
    emit(Locale(code));
  }
}
