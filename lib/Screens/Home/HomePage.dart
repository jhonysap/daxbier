import 'package:daxbier_app/Screens/Book/BookScreen.dart';
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
        Scaffold(
          appBar: AppBar(
            title: Text("Carteira"),
            centerTitle: true,
          ),
          drawer: CustomerDrawer(_pageController),
          body: Container(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Book de Ofertas"),
            centerTitle: true,
          ),
          drawer: CustomerDrawer(_pageController),
          body: BookScreen(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Proximos Eventos"),
            centerTitle: true,
          ),
          drawer: CustomerDrawer(_pageController),
          body: Container(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Historico"),
            centerTitle: true,
          ),
          drawer: CustomerDrawer(_pageController),
          body: Container(),
        ),
      ],
    );
  }
}
