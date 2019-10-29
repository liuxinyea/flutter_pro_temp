import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/animation/animated_decorated_box1.dart';

class TransitionWidgetRoute extends StatefulWidget {
  TransitionWidgetRoute({Key key}) : super(key: key);

  @override
  _TransitionWidgetRouteState createState() => _TransitionWidgetRouteState();
}

class _TransitionWidgetRouteState extends State<TransitionWidgetRoute> {
  Color _color=Colors.blue;
  var duration=Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡组件"),
      ),
      body: Center(
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: BoxDecoration(

              color: _color
          ),
          child: FlatButton(
              onPressed: (){
                setState(() {
                  _color = Colors.red;
                });
              },
              child: Text("AnimatedDecoratedBox",
                style: TextStyle(color: Colors.white),
              )
          ),
        ),
      ),
    );
  }
}