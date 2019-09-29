import 'package:flutter/material.dart';
class ImageDemoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getPage(context);
  }
  Widget getPage(context){
     return Scaffold(
       appBar: AppBar(
         title:Text("图片使用Demo"),
         centerTitle: true,
       ),
       body:new SingleChildScrollView(
            child: new Center(
              child: Container(
//                color: Colors.amber,
                child:Column(
                  children: <Widget>[
                    Text("加载assets下图片资源",
                      style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Image(image: AssetImage("assets/img/pic1.png"),
                      width: 100.0,
                    ),
                    Text("加载网络图片资源",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                    ),
                    Image(image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                      width: 100.0,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.darken,
                    ),
                    new SizedBox(
                      width: 150,
                      child: Text("加载File图片资源,学完file相关的来添加例子",
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                    )

                  ],
                ),
              ),
            )


       ),

     );
  }
}