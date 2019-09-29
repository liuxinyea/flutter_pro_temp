import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/page/DemoPage.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
class HostPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HostPage();
  }
}
class _HostPage extends State<HostPage>{
  int _selectedIndex = 0;
  Widget content;
  String contentTitle="Demo";
  @override
  void initState() {
    super.initState();
    content=new DemoPage();
  }
  @override
  Widget build(BuildContext context) {
//
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("$contentTitle",
            style: new TextStyle(
                fontSize: 21,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
          /*通常用来打开抽屉*/
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions:[

          ],
          backgroundColor: Colors.green,
        ),
        //抽屉菜单
        drawer:new Drawer(
          child: MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: false,
            child:new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/img/pic1.png",
                            width: 80,
                          ),
                        ),
                      ),
                      Text(
                        "Wendux",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text('Add account'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Manage accounts'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: new Container(
            padding: EdgeInsets.only(left: 0,right: 0,top:0),
            child:new Column(
              children: <Widget>[
                 Center(
                   child: content,
                 )
              ],
            )
        ),
        bottomNavigationBar:new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('官方Demo')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('工作')),
            BottomNavigationBarItem(icon: Icon(Icons.camera), title: Text('功能')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('我的')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        )
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex){
        case 0:
          contentTitle="官方Widget";
          content=new DemoPage();
          break;
        case 1:
          contentTitle="工作";
          content=new Text("$contentTitle");
          break;
        case 2:
          contentTitle="功能";
          content=new Text("$contentTitle");
          break;
        case 3:
          contentTitle="我的";
          content=new Text("$contentTitle");
          break;
        default:
          break;
      }
    });
  }
}
