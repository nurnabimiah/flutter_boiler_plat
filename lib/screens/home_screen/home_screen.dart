

import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/drawer/my_drawer.dart';

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
        backgroundColor:Colors.blue ,
        title: const Text('Basic Flutter',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),),
      ),
      drawer: MyDrawer(),
    );
  }
}
