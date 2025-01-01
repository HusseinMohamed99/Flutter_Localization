import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/generated/l10n.dart';
import 'package:flutter_localization/logic/change_language_state.dart';
import 'package:intl/intl.dart';

// Define your Cubit and State classes
class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageState.initial());

  String currentLanguage = 'en';

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  void changeLanguage() {
    emit(ChangeLanguageState.loading());
    if (isArabic()) {
      currentLanguage = 'en';
      // Load the English language (using S.load from your localization files)
      S.load(Locale(currentLanguage));
      emit(ChangeLanguageState.loaded(language: currentLanguage));
    } else {
      currentLanguage = 'ar';
      // Load the Arabic language (using S.load from your localization files)
      S.load(Locale(currentLanguage));
      emit(ChangeLanguageState.loaded(language: currentLanguage));
    }
    // Update the locale for the app
    Intl.defaultLocale = currentLanguage;
  }
}
