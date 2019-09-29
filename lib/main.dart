import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/ListPage.dart';
import 'package:my_first_flutter_pro/host.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';

void main() {
  /*捕获flutter的异常*/
//  FlutterError.onError = (FlutterErrorDetails details) {
//    reportError(details);
//  };
   //MaterialApp是管理Material风格APP的脚手架
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    /*MaterialApp的首页*/
    home: new LoginHomePage(),
    /*设置app的主题样式*/
    theme: new ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      accentColor: Colors.green,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          highlightColor:  Colors.lightGreen
      )
    ),
    /*MaterialApp的路由管理*/
    routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => LoginHomePage(),
      '/home': (BuildContext context) =>HostPage(),
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
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 30,right: 30,top:100),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: userNameController,
              decoration: new InputDecoration(
                hintText: '请输入用户名',
                labelText: "用户名",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            new TextField(
              controller: pwdController,
              decoration: new InputDecoration(
                labelText: "密码",
              hintText: '请输入密码',
              prefixIcon: Icon(Icons.lock),
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