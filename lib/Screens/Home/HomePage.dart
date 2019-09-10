import 'package:daxbier_app/Widgets/CustomerDrawer.dart';
import 'package:flutter/material.dart';
import 'HomeTab.dart';

class HomePage extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomerDrawer(_pageController),
        ),
      ],
    );
  }
}
