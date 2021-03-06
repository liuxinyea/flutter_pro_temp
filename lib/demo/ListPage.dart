import 'package:flutter/material.dart';
class ListPage extends StatefulWidget{

  ListPage({Key key}) :super(key: key);

  @override
  _ListPage createState() => new _ListPage();
}
class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("列表页",style:new TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}
/*listView显示的字组件*/
List<Widget> list = <Widget>[
new ListTile(
title: new Text('CineArts at the Empire',
style: new TextStyle(fontWeight: FontWeight.w500, fontSize:15.0)),
subtitle: new Text('85 W Portal Ave'),
leading:  new Image.asset('assets/img/pic1.png',width:80,height:80,),
),
new ListTile(
title: new Text('The Castro Theater',
style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
subtitle: new Text('429 Castro St'),
leading: new Image.asset('assets/img/pic2.png',width:80,height:80,),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.ac_unit,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.beach_access,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.camera,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.dashboard,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.email,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.face,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.inbox,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.headset,
    color: Colors.blue[500],
  ),
),
new ListTile(
  title: new Text('The Castro Theater',
      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
  subtitle: new Text('429 Castro St'),
  leading: new Icon(
    Icons.gamepad,
    color: Colors.blue[500],
  ),
),
];
/*创建Grid视图子对象*/
List<Container> _buildGridTileList(int count) {

  return new List<Container>.generate(
      count,
          (int index) =>
      new Container(child: new Image.asset('assets/img/pic${index+1}.png')));
}
//创建GridView视图
Widget buildGrid() {
  return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(2));
}