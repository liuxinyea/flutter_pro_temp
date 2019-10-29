import 'package:flutter/material.dart';
class NotificationTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificationTestRouteState();
  }

}
class _NotificationTestRouteState extends State<NotificationTestRoute>{
  double _offset=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text("Notification"),
         centerTitle: true,
       ),
       body:NotificationListener<ScrollUpdateNotification>(
         onNotification: (notification){
             switch (notification.runtimeType) {
               case ScrollStartNotification:
                break;
               case ScrollUpdateNotification:
                  print(notification.toString());
                  setState(() {
                    _offset+=notification.scrollDelta.floorToDouble();
                  });
                 break;
               case ScrollEndNotification:
                 print("滚动停止");
                 break;
                case OverscrollNotification:
                 print("滚动到边界");
                //  print(notification.toString());
                 break;
               default:
             }
         },
         child:Stack(
            children: <Widget>[
               ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return ListTile(title: Text("ListItem$index"),);
                  },
               ),
               Positioned(
                 top: 200.0,
                 left: 180,
                 child: CircleAvatar(
                    radius: 30,
                    child: Text(_offset.toString()),
                 ),
               )
            ],
         ) 
       )
    );
  }

}