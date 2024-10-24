import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/localization_provider/localization_provider.dart';
import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
import 'package:flutter_basic/screens/home_screen/home_screen.dart';
import 'package:flutter_basic/utils/const/stripe_doc/stripe_const_file.dart';
import 'package:flutter_basic/utils/theme/dark_theme.dart';
import 'package:flutter_basic/utils/theme/ligth_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Stripe with your publishable key
  Stripe.publishableKey = StripeConstFile.publishKey;

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => LocalizationProvider()),
          ],
          child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Boiler Plate',
      theme: themeProvider.isDarkMode ? dark : light,
      locale: localizationProvider.locale,
      supportedLocales: localizationProvider.supportedLocalesList,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return supportedLocales.first;
        }

        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first; // Default to the first supported locale
      },
      home: const HomeScreen(),
    );
  }
}

