import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/CommentWidget.dart';
import 'package:my_first_flutter_pro/demo/FormDemo.dart';
import 'package:my_first_flutter_pro/demo/ImageDemoPage.dart';
import 'package:my_first_flutter_pro/demo/ListPage.dart';
import 'package:my_first_flutter_pro/demo/StackAndPositionedDemo.dart';
import 'package:my_first_flutter_pro/demo/SuperScrollerListDemo.dart';
import 'package:my_first_flutter_pro/demo/LoadingList.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
import 'package:my_first_flutter_pro/demo/WrapLayoutDemo.dart';
class DemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DemoPage();
  }
}
class _DemoPage extends State<DemoPage>{
  bool _switchSelected=false; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scrollbar(
        child:SingleChildScrollView(
          child:  new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*按钮使用*/
              new Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20),
                child:  new Wrap(
                  spacing: 25,
                  runSpacing: 10,
                  children: <Widget>[
                    getBtn("图片Demo",new ImageDemoPage()),
                    getBtn("表单Form例子",new FormTestRoute()),
                    getBtn("流式布局Demo",new WrapPageDemo()),
                    getBtn("层叠布局Demo",new StackAndPositionedPage()),
                    getBtn("常用小控件",new CommentWidgetPage()),
                    getBtn("无限列表",new SampleAppPage()),
                    getBtn("Sliver",new CustomScrollViewTestRoute()),
                    getBtn("通用列表",new ListPage()),
            ],
                ),
              )
            ],
          ),
        )
    );
  }
  Widget getBtn(String btnName,Widget demoPage){
     return new FlatButton(
       color: Colors.blue,
       highlightColor: Colors.blue[700],
       colorBrightness: Brightness.dark,
       splashColor: Colors.grey,
       child: Text(btnName),
       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       onPressed:(){
         Navigator.push( context,
             new MaterialPageRoute(builder: (context) {
               return demoPage;
             },fullscreenDialog:false,));
       },
     );
  }
}