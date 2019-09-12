import 'package:flutter/material.dart';
import 'package:daxbier_app/Screens/Home/HomePage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Models/UserModels.dart';
import 'Screens/Login/LoginPageSimples.dart';
import 'Screens/Login/LoginScreen.dart';
import 'Screens/Login/SignPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'DAX BIER',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            primaryColor: Color.fromARGB(255, 47,79,79)
        ),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
