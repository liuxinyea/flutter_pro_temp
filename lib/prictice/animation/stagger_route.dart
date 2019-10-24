import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/animation/stagger_animation.dart';

class StaggerRoute extends StatefulWidget {
  StaggerRoute({Key key}) : super(key: key);

  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
  }

  Future<Null> _playAnimation() async{
    try{
      await _controller.forward().orCancel;
      await _controller.reverse();
//      _controller.repeat();
    }on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.reset();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("交織動畫"),),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                    color: Colors.black.withOpacity(.5)
                )
            ),
            child: StaggerAnimation(
              controller: _controller,
            ),
          ),
        ),
      )
    );
  }
}