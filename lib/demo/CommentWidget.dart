import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/TapBoxA.dart';
import 'package:my_first_flutter_pro/util/Toast.dart';
//首页界面
class CommentWidgetPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CommentWidgetPage();
  }
}
class _CommentWidgetPage extends State<CommentWidgetPage>{
  bool _switchSelected=false; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("常用小控件"),
      ),
      body:new Scrollbar(
          child:SingleChildScrollView(
            child:  new Column(
              children: <Widget>[
                new TapBoxA(),
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
                new FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("按钮"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed:(){
                  },
                ),
                /*图片使用*/
                new Image(
                  image: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                  width:100.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                  height:150,
                  repeat: ImageRepeat.repeatY,
                ),
                new Switch(
                    value: _switchSelected,
                    onChanged: (value){
                      setState(() {
                        _switchSelected=value;
                      });
                    }),
                new Checkbox(
                  value: _checkboxSelected,
//                  activeColor: Colors.green, //选中时的颜色
                  onChanged:(value){
                    setState(() {
                      _checkboxSelected=value;
                    });
                  } ,
                ),
                new  Column(
                  children: <Widget>[
                    //Flex的两个子widget按1：2来占据水平空间
                    new Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 30.0,
                            color: Colors.red,
                            child: new Text("flex:1"),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            color: Colors.green,
                            child: new Text("flex:2"),
                          ),
                        ),
                      ],
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 100.0,
                        //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                        child: new Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 30.0,
                                color: Colors.red,
                                child: new Text("flex:2"),
                              ),
                            ),
                            /*间隔*/
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 30.0,
                                color: Colors.green,
                                child: new Text("flex:1"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

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