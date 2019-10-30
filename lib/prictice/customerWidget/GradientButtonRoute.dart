import 'package:flutter/material.dart';

import 'GradientButton.dart';

class GradientButtonRoute extends StatefulWidget {
  GradientButtonRoute({Key key}) : super(key: key);

  @override
  _GradientButtonRouteState createState() {
    return _GradientButtonRouteState();
  }
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double _width=200;
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义按钮"),
      ),
      body:new Center(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors:[Colors.blueAccent,Colors.red],
              child: Text("按钮1"),
              height: 50,
              width: _width,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onPressed: (){
                setState(() {
                   _width=50;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}