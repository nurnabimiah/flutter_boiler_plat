
import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/localization_provider/localization_provider.dart';
import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';


String? getTranslated(String? key, BuildContext context) {
  return Provider.of<LocalizationProvider>(context, listen: false).translate(key!);
}



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'bn':
        return 'Bengali';
      case 'hi':
        return 'Hindi';
      default:
        return languageCode; // Return the code if the language is not recognized
    }
  }

  @override
  Widget build(BuildContext context) {

    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? Theme.of(context).cardColor
                      : Theme.of(context).primaryColor,
                ),
                child:  Text(
                  // Here you need to provide the correct key
                  getTranslated('settings', context) ?? 'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              );
            },
          ),

          // Theme Switch
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                );
              },
            ),
          ),

          // Language Selection
          ListTile(
            title: const Text('Language'),
            trailing: Consumer<LocalizationProvider>(
              builder: (context, localizationProvider, child) {

                return DropdownButton<Locale>(
                  value: localizationProvider.locale,
                  items: localizationProvider.supportedLocalesList.map((locale) {
                    String languageName = _getLanguageName(locale.languageCode);
                    return DropdownMenuItem(
                      value: locale,
                      child: Text(languageName),
                    );
                  }).toList(),
                  onChanged: (Locale? newValue) {
                    if (newValue != null) {
                      localizationProvider.changeLocale(
                        newValue.languageCode,
                        newValue.countryCode,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}