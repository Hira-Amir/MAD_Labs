// navigation

import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'DetailScreen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
     (
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      initialRoute: '/',
      routes:
      {
        '/': (context) => const HomeScreen(title: "Welcome to Home Screen"),
        '/detail': (context) => const DetailScreen(title: "Welcome to Detail Screen"),
      },
    );
  }
}
