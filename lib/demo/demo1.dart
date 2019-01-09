import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  addChild(){
  }
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  new Icon(Icons.home),
                  new Text("首页")
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.panorama),
                new Text("相册")
              ],
            ),
            new Column(
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