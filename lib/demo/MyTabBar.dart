import 'package:flutter/material.dart';
class MyTabBar extends StatelessWidget {
  addChild(){
  }
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new SizedBox(
        height:70,
        child:new Card(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Icon(Icons.home),
                  new Text("首页")
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Icon(Icons.list),
                  new Text("列表")
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Icon(Icons.panorama),
                  new Text("相册")
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Icon(Icons.palette),
                  new Text("影片")
                ],
              )
            ],
          ),
        )
    );
  }
}