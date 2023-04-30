import 'package:flutter/material.dart';
import 'package:ui_app/prefs/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier {

  String language = SharedPrefController().language;
  bool darkTheme = SharedPrefController().darkTheme;

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en' ;
    SharedPrefController().changeLanguage(lang: language);
    notifyListeners();
  }

  void changeTheme() {
    darkTheme = darkTheme == false ? true : false;
    SharedPrefController().changeTheme(darkTheme: darkTheme);
    notifyListeners();
  }

}