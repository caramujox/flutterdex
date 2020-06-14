import 'package:flutter/material.dart';
import 'package:flutterdex/consts/consts_app.dart';
import 'package:flutterdex/pages/homepage/widgets/appbar_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              child: Opacity(
                child: Image.asset(
                  ConstsApp.darkPokeball,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.1,
              ),
              top: -(240 / 3.8),
              left: screenWidth - (240 / 1.6),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: statusWidth,
                    color: Colors.red,
                  ),
                  AppBarHome(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(title: Text('Pokemon'),),
                        ListTile(title: Text('Pokemon'),),
                        ListTile(title: Text('Pokemon'),),
                        ListTile(title: Text('Pokemon'),),
                        ListTile(title: Text('Pokemon'),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
          overflow: Overflow.visible,
        ));
  }
}
