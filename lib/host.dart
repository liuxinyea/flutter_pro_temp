import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/MyTabBar.dart';
import 'package:my_first_flutter_pro/page/homePage.dart';
import 'package:my_first_flutter_pro/view/BannerView.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:my_first_flutter_pro/view/LoginFormCode.dart';
class HostPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HostPage();
  }
}
class _HostPage extends State<HostPage>{
  int _selectedIndex = 0;
  String content="";
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
                height:240,
                child:new BannerView(),
              ),
              getTabView()
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
//        fixedColor: Colors.green,
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
  Widget getTabView(){
      switch (_selectedIndex){
        case 0:
          content="Home";
          break;
        case 1:
          content="Business";
          break;
        case 2:
          content="aa";
          break;
        case 3:
          content="my";
          break;
        default:
          break;
      }
      Text tabView=new Text("Tab_$content",style: new TextStyle(
          fontSize: 25,
          color: Colors.white
      ));
      RaisedButton button=new RaisedButton(onPressed: (){
//         Navigator.pushNamed(context, "/list");
        Navigator.push( context,
            new MaterialPageRoute(builder: (context) {
              return new HomePage();
            },fullscreenDialog:false,));
      },child: tabView,
      padding: EdgeInsets.all(10),);
      Widget view= Container(child: button,margin: EdgeInsets.only(top: 50));
      return view;
  }
}
