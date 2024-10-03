


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const DrawerHeader(
            decoration:BoxDecoration(color: Colors.blue),
            child: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 24)),
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

          // Localization Dropdown
          // ListTile(
          //   title: Text('Language'),
          //   trailing: Consumer<LocalizationProvider>(
          //     builder: (context, localizationProvider, child) {
          //       return DropdownButton<String>(
          //         value: localizationProvider.locale.languageCode,
          //         items: [
          //           DropdownMenuItem(child: Text('English'), value: 'en'),
          //           DropdownMenuItem(child: Text('Spanish'), value: 'es'),
          //         ],
          //         onChanged: (value) {
          //           if (value != null) {
          //             localizationProvider.changeLocale(value);
          //           }
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}