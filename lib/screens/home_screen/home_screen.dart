

import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/theme_provider/theme_provider.dart';
import 'package:flutter_basic/widgets/drawer/my_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Provider.of<ThemeProvider>(context).isDarkMode ? Theme.of(context).cardColor:  Theme.of(context).primaryColor,
        title: const Text('Basic Flutter',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MyDrawer(),
    );
  }
}
