import 'package:flutter/material.dart';
import 'package:daxbier_app/Screens/Home/HomePage.dart';
import 'Screens/onboarding/onboarding_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAX BIER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 15, 100)
      ),
      home: OnBoardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
