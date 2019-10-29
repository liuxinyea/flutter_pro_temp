import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/event/EventBus.dart';

class EventBusTestRoute extends StatefulWidget {
  EventBusTestRoute({Key key}) : super(key: key);

  @override
  _EventBusTestRouteState createState() => _EventBusTestRouteState();
}

class _EventBusTestRouteState extends State<EventBusTestRoute> {
  var _message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _message="hello";
    var bus=new EventBus();
    return Scaffold(
       appBar: AppBar(
         title: Text("事件总线"),
         centerTitle: true,
       ),
       body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text(_message==null?"aa":_message,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
               Listener(
                 child: CircleAvatar(
                   radius: 30,
                   child: Text("update"),
                 ),
                 onPointerUp: (details){
                    bus.emit("updateMessage","world");
                 },
               )

            ],
          ),
       ),
    );
  }
}