import 'package:daxbier_app/Tiles/Drawer_Tile.dart';
import 'package:flutter/material.dart';

class CustomerDrawer extends StatelessWidget {

  final PageController pageController;

  CustomerDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 240,230,140),
                Color.fromARGB(255, 255,69,0)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10.0,
                      left: 30.0,
                      child: Text("DAX BIER",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text("Seja Bem Vindo, ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            child: Text("Entre ou Cadastre-se ",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.account_balance_wallet, "Carteira", pageController, 1),
              DrawerTile(Icons.attach_money, "Book de Ofertas", pageController, 2),
              DrawerTile(Icons.event, "Proximos Eventos", pageController, 3),
              DrawerTile(Icons.playlist_add_check, "Histórico de Eventos", pageController, 4),
              DrawerTile(Icons.equalizer, "Rankings", pageController, 5),
            ],
          )
        ],
      ),
    );
  }
}
