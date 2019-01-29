import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/MyTabBar.dart';
import 'package:my_first_flutter_pro/view/BannerView.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:my_first_flutter_pro/view/LoginFormCode.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePage();
  }
}
class _HomePage extends State<HomePage>{
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];
  @override
  Widget build(BuildContext context) {
//
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页",style: new TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      endDrawer: ListView(
        padding: EdgeInsets.only(top: 0,right: 0),
        children: <Widget>[
            ListTile(
                  title:new Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 150),
                    color: Colors.white,
                    child: new Text("item1"),
                  ),
                  onTap:(){
                    Navigator.pop(context);
                  },
                  contentPadding:EdgeInsets.only(right: 0) ,
                ),
        ],
      ),
      body: new Container(
          padding: EdgeInsets.only(left: 0,right: 0,top:0),
          child:new Column(
            children: <Widget>[
              new SizedBox(
                height:200,
                child:new BannerView(),
              ),
            ],
          )
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
        BottomNavigationBarItem(icon: Icon(Icons.camera), title: Text('aa')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('my')),
      ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      )
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
