import 'package:flutter/material.dart';

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key, this.decoration, this.child, this.duration, this.curve, this.reverseDuration,
  }) : super(key: key);

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
  with SingleTickerProviderStateMixin{

  @protected
  AnimationController get controller=>_controller;
  AnimationController _controller;

  Animation<double> _animation;
  Animation<double> get animation=>_animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context,child){
           return DecoratedBox(
             decoration: _tween.animate(_animation).value,
             child: widget.child,

           );
        },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
       duration: widget.duration,
       reverseDuration: widget.reverseDuration
    );
    _tween=DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if(widget.curve!=null){
      _animation=CurvedAnimation(parent: _controller,curve: widget.curve);
    }else{
      _animation=_controller;
    }
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(widget.curve!=oldWidget.curve){//动画曲线发生变化
      _updateCurve();
    }
    _controller.duration=widget.duration;
    _controller.reverseDuration=widget.reverseDuration;
    if(widget.decoration!=(_tween.end??_tween.begin)){
      _tween
        ..begin=_tween.evaluate(_animation)
        ..end=widget.decoration;
      _controller
        ..value=0.0
        ..forward();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}