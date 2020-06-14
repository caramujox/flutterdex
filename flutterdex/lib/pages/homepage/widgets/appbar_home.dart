import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 11.5, right: 5),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Pokedex',
                style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
          ],
        )
      ]),
      height: 120,
//                    color: Color.fromARGB(100, 240, 245, 210),
    );
  }
}
