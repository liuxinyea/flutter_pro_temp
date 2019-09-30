import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/view/NavBar.dart';

class NavBarColorRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        AppBar(
          title: Text("navBar"),
        ),
        NavBar(
          title: "NavBar Light",
          color: Colors.white,
        ),
        NavBar(
          title: "NavBar Dark",
          color: Colors.black38,
        ),
        NavBar(
          title: "NavBar Bulue",
          color: Colors.blue,
        )
      ],
    );
  }

}