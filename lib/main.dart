import 'package:flutter/material.dart';
import 'package:shoping_hotic/view/main_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shoping_hotic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNavigator()
    );
  }
}


           