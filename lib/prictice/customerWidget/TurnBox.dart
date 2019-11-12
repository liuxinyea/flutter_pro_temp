import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  TurnBox({Key key, this.child, this.speed=200, this.turns=.0}) : super(key: key);
  
  final Widget child;
  final int speed;
  final double turns;

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with  SingleTickerProviderStateMixin {

  AnimationController _controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=new AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value=widget.turns;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  RotationTransition(
      turns:_controller,
      child: widget.child,
    );
  }
  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns!=widget.turns){
      _controller.animateTo(
         widget.turns,
         duration:Duration(milliseconds: widget.speed??200),
         curve: Curves.easeOut,
      );
    }
  }
}