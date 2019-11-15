import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    //当状态变化是决定其子孙节点是否重新渲染，返回true重新渲染
    return true;
  }
}
//实现Listenable接口，实现此接口表示为可监听的，可观察的
class MyChangeNotifier implements Listenable{

  List listeners=[];

  //添加观察者
  @override
  void addListener(listener) {
     listeners.add(listener);
  }
  //移除观察者
  @override
  void removeListener(listener) {
    listeners.remove(listener);
  }
  //通知观察者
  void notifyListener(){
    //通知所有监听器，触发监听器回调
    listeners.forEach((item)=>item());
  }

}

// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

class ChangeNotifierProvider <T extends MyChangeNotifier> extends StatefulWidget{
  final Widget child;
  final T data;
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child
  });

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context){
     final type=_typeOf<InheritedProvider<T>>();
     final provider=context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
     return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends MyChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    // 给model添加监听器
    widget.data.addListener(update);
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
