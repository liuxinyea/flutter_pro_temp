/*流式布局demo*/
import 'package:flutter/material.dart';

class WrapPageDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WrapPageDemo();
  }
}
class _WrapPageDemo extends State<WrapPageDemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("流式布局demo"),
      ),
      body:new Column(
        children: <Widget>[
          new SizedBox(
            child: new Text("Wrap布局",
            style: new TextStyle(
              fontSize: 25
            ),),
            height: 30,
          ),
          new Wrap(
            spacing: 10.0, // 主轴(水平)方向间距
            runSpacing: 10.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.spaceBetween, //沿主轴方向居中
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
            ],
          ),
          new SizedBox(
            child: new Text("Flow布局",
              style: new TextStyle(
                  fontSize: 25
              ),),
            height: 30,
          ),
          new Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(5.0)),
            children: <Widget>[
              new Container(width: 80.0, height:80.0, color: Colors.red,),
              new Container(width: 80.0, height:80.0, color: Colors.green,),
              new Container(width: 80.0, height:80.0, color: Colors.blue,),
              new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
              new Container(width: 80.0, height:80.0, color: Colors.brown,),
              new Container(width: 80.0, height:80.0,  color: Colors.purple,),
            ],
          )
        ],
      ),

    );
  }
}
/*相当于一个适配器*/
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
