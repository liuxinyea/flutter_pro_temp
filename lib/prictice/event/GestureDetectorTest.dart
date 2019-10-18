import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute>{
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
         children: <Widget>[
           Positioned(
             top: _top,
             left: _left,
             child: GestureDetector(
               child: CircleAvatar(child: Text("A")),
               onPanDown: (DragDownDetails e){

               },
               onPanUpdate: (DragUpdateDetails e){

               },
               onPanEnd: (DragEndDetails  e){

               },
             ),
           )
         ],
    );
  }

}

