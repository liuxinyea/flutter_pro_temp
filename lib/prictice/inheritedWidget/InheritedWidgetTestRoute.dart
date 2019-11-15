import 'package:flutter/material.dart';
import 'Inheritedwidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedWidgetTestRoute();
  }

}

class _InheritedWidgetTestRoute extends State<InheritedWidgetTestRoute>{
  int count=0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ShareDataWidget(
          data:count,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          )
      )
    );
  }

}

class _TestWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    super.didChangeDependencies();
    print("Dependencise change");
  }

}