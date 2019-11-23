import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaleAnimationRouteState();
  }

}
//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds:1000), vsync: this);
    /*添加执行动画的曲线*/
    animation=CurvedAnimation(parent: controller,curve: Curves.bounceOut);
    //添加动画的执行区间，类似装饰着模式
    animation = new Tween(begin: 0.0, end: 400.0).animate(animation);
    animation.addStatusListener((status){
        if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
            controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
           controller.forward();
         }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
           child: Image.asset('./assets/img/aaa.jpg'),
           animation: animation,
      );
    
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, 
                width: animation.value, 
                child: child
            );
          },
          child: child
      ),
    );
  }
}