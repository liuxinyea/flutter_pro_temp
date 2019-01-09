import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePage();
  }
}
class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页",style: new TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
        ),
        backgroundColor: Colors.green,
      ),
      body: new Container(
          padding: EdgeInsets.only(left: 30,right: 30,top:100),
          child: new Center(
            child: new RaisedButton(onPressed:(){
              Navigator.pop(context);
            },
            child: new Text("返回"),
            ),
          )
      ),
    );
  }

}