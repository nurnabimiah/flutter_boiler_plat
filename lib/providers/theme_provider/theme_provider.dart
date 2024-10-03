



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends ChangeNotifier{

  bool isDarkMode = false;


  ThemeProvider(){
    loadThemeFromPrefs();
  }


  void toggleTheme(bool isDark){
    isDarkMode = isDark;
    saveThemeToPrefs(isDark);
    notifyListeners();
  }


  Future<void> loadThemeFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Mode is : $isDarkMode');
    notifyListeners();

  }


  Future<void> saveThemeToPrefs(bool isDark) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);

  }


}