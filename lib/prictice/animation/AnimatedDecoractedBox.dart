import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  
  final BoxDecoration decoration;
  final Widget child;

  AnimatedDecoratedBox({Key key,
  @required this.decoration,
  this.child,
  Curve curve=Curves.linear,
  @required Duration duration,
  Duration reverseDuration
  }): super(
          key: key,
          curve: curve,
          duration: duration,
        );



  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    // TODO: implement createState
    return _AnimatedDecoratedBoxState();
  }
  
  
}

class _AnimatedDecoratedBoxState extends AnimatedWidgetBaseState<AnimatedDecoratedBox>{

  DecorationTween _decoration;//定义一个补间

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration=visitor(_decoration,widget.decoration,(value){
        return DecorationTween(begin: value);
    });
  }
  
}