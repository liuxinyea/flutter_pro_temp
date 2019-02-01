import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/CommentWidget.dart';
import 'package:my_first_flutter_pro/demo/ContainerDemo.dart';
import 'package:my_first_flutter_pro/demo/FormDemo.dart';
import 'package:my_first_flutter_pro/demo/StackAndPositionedDemo.dart';
import 'package:my_first_flutter_pro/demo/SuperScrollerListDemo.dart';
import 'package:my_first_flutter_pro/demo/TapBoxA.dart';
import 'package:my_first_flutter_pro/demo/LoadingList.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:my_first_flutter_pro/demo/WrapLayoutDemo.dart';
import 'package:my_first_flutter_pro/view/LoadListView.dart';
//首页界面
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePage();
  }
}
class _HomePage extends State<HomePage>{
  bool _switchSelected=false; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text("Home"),
      ),
      body:new Scrollbar(
          child:SingleChildScrollView(
            child:  new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: "Home: "
                      ),
                      TextSpan(
                          text: "https://flutterchina.club",
                          style: TextStyle(
                              color: Colors.blue
                          ),
                          recognizer: null
                      ),
                    ]
                )),
                /*按钮使用*/
                new Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 20),
                  child:  new Wrap(
                    spacing: 25,
                    runSpacing: 10,
                    children: <Widget>[
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("表单Form例子"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new FormTestRoute();
                              },fullscreenDialog:false,));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("流式布局Demo"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new WrapPageDemo();
                              },fullscreenDialog:false));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("层叠布局Demo"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new StackAndPositionedPage();
                              },fullscreenDialog:false));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("常用小控件"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new CommentWidgetPage();
                              },fullscreenDialog:false));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("容器类widget"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new ContainerPage();
                              },fullscreenDialog:false));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("无限列表"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new SampleAppPage();
                              },fullscreenDialog:false));
                        },
                      ),
                      new FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("Sliver"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed:(){
                          Navigator.push( context,
                              new MaterialPageRoute(builder: (context) {
                                return new CustomScrollViewTestRoute();
                              },fullscreenDialog:false));
                        },
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
      ),

      floatingActionButton: new FloatingActionButton(onPressed: (){
             Toast.toast(context, "click");

      }, child:new Icon(Icons.add),
     ),
    );
  }

}