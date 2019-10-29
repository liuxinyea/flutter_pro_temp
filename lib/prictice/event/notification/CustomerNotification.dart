import 'package:flutter/material.dart';

class MyNotification extends Notification{
     String msg;
     MyNotification(this.msg);
}

class CustomerNotificationRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CustomerNotificationRouteState();

}

class _CustomerNotificationRouteState extends State<CustomerNotificationRoute>{
  var _msg="";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(title: Text("MyNotification")),
       body: NotificationListener<MyNotification>(
          onNotification:(notification){
               setState(() {
                   _msg+=notification.msg+"  ";
                });
                return true;
          } ,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                   builder: (context){
                      return  RaisedButton(onPressed: (){
                     MyNotification("Hello").dispatch(context);
                    },
                      child: Text("Send Notification"),
                   );
                   },
                ),
                Text(_msg)
              ],
            ),
          ),
       ),
    );
  }
  
}