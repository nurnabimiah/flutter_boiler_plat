import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
import 'package:flutter_basic/screens/home_screen/home_screen.dart';
import 'package:flutter_basic/utils/theme/dark_theme.dart';
import 'package:flutter_basic/utils/theme/ligth_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).isDarkMode ? dark : light,
      home: const HomeScreen(),
    );
  }
}
