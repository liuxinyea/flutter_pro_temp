import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureDetectorTestRouteState();
  }

}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute>{
  double _top = 160.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  double _leftB = 100.0;//距左边的偏移
  double _width=200.0;
  TapGestureRecognizer _tapGestureRecognizer=new TapGestureRecognizer();
  bool __toggle=false;
  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
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
                 /*缩放手势*/
                 Center(
                    child: GestureDetector(
                       child: Image.asset("./assets/img/aaa.jpg",width: _width),
                      onScaleUpdate: (ScaleUpdateDetails details){
                         setState(() {
                           _width=200*details.scale.clamp(0.8, 10);
                         });
                      },
                      onDoubleTap: (){
                        setState(() {
                          _width=200.0*2;
                        });
                      },
                    ),
                 ),
                 Center(
                   child:Text.rich(
                     TextSpan(
                       children: [
                         TextSpan(text: "你好世界"),
                         TextSpan(
                           text: "点我变色",
                           style: TextStyle(
                             fontSize: 28.0,
                             color: __toggle?Colors.red:Colors.blue
                           ),
                           recognizer: _tapGestureRecognizer
                             ..onTap=(){
                               setState(() {
                                 __toggle = !__toggle;
                               });
                             }
                         )
                       ]
                     )
                   )
                 ),

               ],
             )
           ),
           /*拖动手势*/
           Positioned(
             top: _top,
             left: _left,
             child: GestureDetector(
               child: CircleAvatar(
                   child: Text("A"),
               ),
//               onPanDown: (DragDownDetails e){
//                   print("用户手指按下：${e.globalPosition}");
//               },
               onVerticalDragUpdate: (DragUpdateDetails e){
                 setState(() {
//                   _left+=e.delta.dx;
                   _top+=e.delta.dy;
                 });
               },
               onHorizontalDragUpdate: (DragUpdateDetails e){
                      setState(() {
                      _left+=e.delta.dx;
//                      _top+=e.delta.dy;
                      });
                },
//               onPanUpdate: (DragUpdateDetails e){
//                   setState(() {
//                       _left+=e.delta.dx;
//                       _top+=e.delta.dy;
//                   });
//               },
//               onPanEnd: (DragEndDetails  e){
//                 //打印滑动结束时在x、y轴上的速度
//                 print(e.velocity);
//               },
             ),
           ),
           /*事件冲突解决,使用listener*/
           Positioned(
             top: 400,
             left: _leftB,
             child: Listener(
               onPointerDown: (details){
                 print("down");
               },
               onPointerUp: (details){
                 //会触发
                 print("up");
               },
               child: GestureDetector(
                 child: CircleAvatar(child: Text("B")),
                 onHorizontalDragUpdate: (DragUpdateDetails details){
                     setState(() {
                        _leftB+=details.delta.dx;
                     });
                 },
                 onHorizontalDragEnd: (detais){
                   print("onHorizontalDragEnd");
                 },
               ),
           ))
         ],
    );
  }

}

