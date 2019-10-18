import 'package:flutter/material.dart';

class ListenerTestRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListenerTestRouteState();
  }

}
class _ListenerTestRouteState extends State<StatefulWidget>{
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 100.0,
          height: 50.0,
          child: Text(_event?.toString()??"",
          style: TextStyle(color: Colors.white,
          fontSize: 14
          )
          ),
      ),
      onPointerDown: (PointerDownEvent event){
           setState(() {
             _event=event; 
           });
      },
      onPointerMove: (PointerMoveEvent event){
           setState(() {
             _event=event; 
           });
      },
      onPointerUp: (PointerUpEvent event){
           setState(() {
             _event=event; 
           });
      },
    );
  }

}