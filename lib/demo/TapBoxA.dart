import 'package:flutter/material.dart';
//Widget管理自身状态
class TapBoxA extends StatefulWidget{
     TapBoxA({Key key}):super(key:key);
     @override
     _TapBoxA createState() =>new _TapBoxA();
}
class _TapBoxA extends State<TapBoxA>{
  bool _active=false;
  void _handleTab(){
    setState(() {
      _active=!_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTab,
      child: new Container(
        child: new Center(
          child: new Text(_active?"Active":"InActive",
          textAlign:TextAlign.left ,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            color: Colors.green,
            fontSize: 32
          ),
          ),
        ),
      ),
    );
  }

}