import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureDetectorTestRouteState();
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
           Container(
             color: Colors.white,
             child: Column(
               children: <Widget>[
                 AppBar(
                     title: Text("手势拖动")
                 ),
               ],
             )
           ),
           Positioned(
             top: _top,
             left: _left,
             child: GestureDetector(
               child: CircleAvatar(
                   child: Text("A"),
               ),
               onPanDown: (DragDownDetails e){
                   print("用户手指按下：${e.globalPosition}");
               },
//               onVerticalDragUpdate: (DragUpdateDetails e){
//                 setState(() {
//                   _left+=e.delta.dx;
//                   _top+=e.delta.dy;
//                 });
//               },
               onHorizontalDragUpdate: (DragUpdateDetails e){
                      setState(() {
                      _left+=e.delta.dx;
                      _top+=e.delta.dy;
                      });
                },
               onPanUpdate: (DragUpdateDetails e){
//                   setState(() {
//                       _left+=e.delta.dx;
//                       _top+=e.delta.dy;
//                   });
               },
               onPanEnd: (DragEndDetails  e){
                 //打印滑动结束时在x、y轴上的速度
                 print(e.velocity);
               },
             ),
           )
         ],
    );
  }

}

