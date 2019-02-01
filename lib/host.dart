import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/MyTabBar.dart';
import 'package:my_first_flutter_pro/page/homePage.dart';
import 'package:my_first_flutter_pro/view/BannerView.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:my_first_flutter_pro/view/LoadListView.dart';
import 'package:my_first_flutter_pro/view/LoginFormCode.dart';
class HostPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HostPage();
  }
}
class _HostPage extends State<HostPage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  String content="主页";
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
//
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("$content",
            style: new TextStyle(
                fontSize: 21,
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
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
        drawer:new Drawer(
          child: MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
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
                new TabBar(   //生成Tab菜单
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: e)).toList(),
                  labelColor: Colors.green,
                  labelStyle: TextStyle(
                    fontSize:18
                  ),
                  unselectedLabelColor: Colors.black26,
                unselectedLabelStyle: TextStyle(
                  fontSize:18
                ),

              ),
                getTabView(),
              ],
            )
        ),
        bottomNavigationBar:new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
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
          content="主页";
          break;
        case 1:
          content="工作";
          break;
        case 2:
          content="功能";
          break;
        case 3:
          content="我的";
          break;
        default:
          break;
      }
    });
  }
  Widget getTabView(){
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
