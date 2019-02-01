import 'package:flutter/material.dart';
import 'dart:math' as math;
/*容器类控件demo*/
class ContainerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ContainerPage();
  }

}
class _ContainerPage extends State<ContainerPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("容器类widget"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 10,
            ),
            new Text("Padding&ConstrainedBox",
                style: TextStyle(
                    fontSize: 22
                )
            ),
            new Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.pinkAccent,
              child:Padding(
                  padding: EdgeInsets.all(20),
                  child:ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: double.infinity, //宽度尽可能大
                        minHeight: 50.0 //最小高度为50像素
                    ),
                    child: Container(
                      height: 5.0,
                      color: Colors.green,
                    ),
                  )
              ) ,
            ),
            new SizedBox(
              height: 10,
            ),
            new Text("Transform",
                style: TextStyle(
                    fontSize: 22
                )
            ),
            new Container(
                margin:EdgeInsets.only(top: 10,bottom: 30),
                child: new Transform(
                  alignment: Alignment.topLeft, //相对于坐标系原点的对齐方式
                  transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Apartment for rent!'),
                  ),
                )
            ),
            new DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(offset: Offset(-20.0, -1.0),
                child: Text("Hello world"),
              ),
            ),
            new SizedBox(
              height: 30,
            ),
            new DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.rotate(
                //旋转90度
                angle:math.pi/2 ,
                child: Text("Hello world"),
              ),
            ),
            new SizedBox(
              height: 40,
            ),
            new Text("Container",
                style: TextStyle(
                    fontSize: 22
                )
            ),
            new  Container(
              margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
              constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
              decoration: BoxDecoration(//背景装饰
                  shape: BoxShape.rectangle,//形状
                  gradient: RadialGradient( //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98
                  ),
                  boxShadow: [ //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
              transform: Matrix4.rotationZ(.2), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text( //卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            )
          ],
        ),
      ),
    );
  }

}