import 'package:flutter/material.dart';
/*层叠布局和绝对定位布局demo*/
class StackAndPositionedPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _StackAndPositionedPage();
  }

}
class _StackAndPositionedPage extends State<StackAndPositionedPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("层叠布局demo"),
      ),
      body:
      //通过ConstrainedBox来确保Stack占满屏幕
      new ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      )
    );
  }

}