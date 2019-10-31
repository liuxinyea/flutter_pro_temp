import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/customerWidget/TurnBox.dart';

class TurnBoxRoute extends StatefulWidget {
  TurnBoxRoute({Key key}) : super(key: key);

  @override
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义旋转组件")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size:50),
            ),
             TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh,size:100),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                 _turns-=.5; 
                });
              },
              child: Text("逆时针旋转1/2圈"),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                 _turns+=.5; 
                });
              },
              child: Text("顺时针旋转1/2圈"),
            )
          ],
        ),
      ),
    );
  }
}