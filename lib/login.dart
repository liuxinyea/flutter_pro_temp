import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/home.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new LoginHomePage(),
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
  Widget build(BuildContext context) {
    // TODO: implement build
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
              ),
            ),
            new TextField(
              controller: pwdController,
              decoration: new InputDecoration(
                hintText: '请输入密码',
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
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => new HomePage()));
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