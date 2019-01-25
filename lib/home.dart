import 'package:flutter/material.dart';
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
      body: new Container(
          padding: EdgeInsets.only(left: 0,right: 0,top:0),
          child:new Column(
            children: <Widget>[
              new BannerView(),
              new RaisedButton(onPressed:(){
                Navigator.pushNamed(context, '/list');
              },
                child: new Text("跳转1"),
              ),
              new LoginFormCode(countdown: 60,onTapCallback: (){
//                Toast.toast(context, "验证码已发送");

                 AlertDialog(
                   title: new Text("提示"),
                 ).build(context);
              },available: true)
            ],
          )
      ),
    );
  }

}
