import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ShareDataWidget extends InheritedWidget{

  int data;//共享的数据

  ShareDataWidget({@required this.data,Widget child}) :super(child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context){
//    return context.inheritFromWidgetOfExactType(ShareDataWidget);
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;

  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;;
  }

}