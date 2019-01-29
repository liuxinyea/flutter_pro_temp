import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/ListPage.dart';
import 'package:my_first_flutter_pro/demo/MyTabBar.dart';
import 'package:my_first_flutter_pro/home.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new LoginHomePage(),
    routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => LoginHomePage(),
      '/home': (BuildContext context) => HomePage(),
      '/list': (BuildContext context) => ListPage(),
    },
  ));
}
class LoginHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginHomePage();
  }
}
class _LoginHomePage extends State<LoginHomePage>{
  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }
  @override
  void didUpdateWidget(LoginHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    debugPrint("setState");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("initState");
    userNameController.text="liuxinye";
    pwdController.text="liu123456";
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint("build");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录",style: new TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 30,right: 30,top:100),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: userNameController,
              decoration: new InputDecoration(
                hintText: '请输入用户名',
                icon: Icon(Icons.account_box)
              ),
            ),
            new TextField(
              controller: pwdController,
              decoration: new InputDecoration(
                hintText: '请输入密码',
                icon: Icon(Icons.phonelink_lock)
              ),
            ),
            new ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed:(){
                    if(userNameController.text=="liuxinye"){
                      if(pwdController.text=="liu123456"){
                        Toast.toast(context, "登陆成功！");
                        Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName("/home"));
                      }
                      else{
                        pwdController.text="";
                        Toast.toast(context, "密码错误！");
                      }
                    }else{
                      userNameController.text="";
                      Toast.toast(context, "用户不存在！");
                    }
                  },
                  padding: EdgeInsets.only(left:50,right:50),
                  color: Colors.green,
                  highlightColor:Colors.lightGreen ,
                  child: new Text("登录",style: new TextStyle(
                    color:Colors.white,
                  ),),
                )
              ],
            ),
          ],
        )
      ),
    );
  }

}