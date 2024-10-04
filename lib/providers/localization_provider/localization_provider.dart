



import 'package:flutter/material.dart';
import 'package:flutter_basic/utils/localization/app_translation/app_translation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier{
   Locale locale = const Locale('en','US');

   LocalizationProvider(){
     loadLocale();
   }

   final Map<String,Locale> supportLocals = {
     'en_us' : const Locale('en','US'),
     'bn_BD': const Locale('bn', 'BD'),
     'hi_IN': const Locale('hi', 'IN'),
   };

   Future<void> loadLocale() async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     final String? languageCode = prefs.getString('languageCode');
     final String? countryCode = prefs.getString('countryCode');

     if(languageCode !=null && countryCode !=null){
       locale = Locale(languageCode,countryCode);
     }
     notifyListeners();
   }


   Future<void> changeLocale(String languageCode, String? countryCode) async {
     locale = Locale(languageCode, countryCode ?? ''); // Use a default value if countryCode is null
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('languageCode', languageCode);
     await prefs.setString('countryCode', countryCode ?? ''); // Set a default value for country code
     notifyListeners();
   }

   // translated key
   String? translate(String key){
     // Get the locale code in a format like 'en_US'
     String localeKey = '${locale.languageCode}_${locale.countryCode}';
     // Return the translation for the key
     return AppTranslations.translations[localeKey]?[key];

   }


   List<Locale> get supportedLocalesList => supportLocals.values.toList();



}