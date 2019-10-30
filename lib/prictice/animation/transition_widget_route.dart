import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/animation/animated_decorated_box1.dart';

import 'AnimatedDecoractedBox.dart';

class TransitionWidgetRoute extends StatefulWidget {
  TransitionWidgetRoute({Key key}) : super(key: key);

  @override
  _TransitionWidgetRouteState createState() => _TransitionWidgetRouteState();
}

class _TransitionWidgetRouteState extends State<TransitionWidgetRoute> {
   double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡组件"),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
              AnimatedDecoratedBox(
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                    color: _color,
                    // shape: BoxShape.circle
                ),
                child: FlatButton(
                    onPressed: (){
                      setState(() {
                        _color = _color == Colors.blue
                                  ? Colors.red
                                  : Colors.blue;
                      });
                    },
                    child: Text("AnimatedDecoratedBox",
                      style: TextStyle(color: Colors.white),
                    )
                ),
              ),
              RaisedButton(
                onPressed: (){
                    setState(() {
                        _padding=_padding>=15?5:15; 
                    });
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(_padding),
                  child: Text("AnimatedPadding"),
                ),
              ),
              SizedBox(
                height: 50,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      left: _left,
                      child: RaisedButton(
                        child: Text("AnimatedPositioned"), onPressed: () {
                            setState(() {
                                _left=_left==120?0:120;
                            });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.grey,
                child: AnimatedAlign(
                  duration: Duration(seconds: 1),
                  alignment: _align,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _align=_align == Alignment.center?Alignment.centerLeft: Alignment.center;
                      });
                    },
                    child: Text("AnimatedAlign"),
                  ),
               ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: _height,
                color: _color,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _height=_height == 150?50:150;
                      _color = Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedContainer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedDefaultTextStyle(
                child: GestureDetector(
                  child: Text("hello world"),
                  onTap: () {
                    setState(() {
                      _style = TextStyle(
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.blue,
                        fontWeight: FontWeight.w400
                      );
                    });
                  },
                ),
                style: _style,
                duration: Duration(seconds: 1),
              ),
          ],
        )  
      ),
    );
  }
}