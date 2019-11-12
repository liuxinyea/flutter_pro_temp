import 'dart:math';
import 'package:flutter/material.dart';

import 'GradientCircularProgressIndicator.dart';
import 'TurnBox.dart';

class GradientCircularProgressRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GradientCircularProgressRouteState();
  }

}
class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 3));

    bool isForward=true;
    _animationController.addStatusListener((status){
      if(status==AnimationStatus.forward){
        isForward=true;
      }else if(status==AnimationStatus.completed||status==AnimationStatus.dismissed){
        if(isForward){
          _animationController.reverse();
        }else{
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text("自定义进度条"),
       ),
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context,child){
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            children: <Widget>[
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 16.0,
                                children: <Widget>[
                                  GradientCircularProgressIndicator(
                                    // No gradient
                                    colors: [Colors.blue, Colors.blue],
                                    radius: 50.0,
                                    strokeWidth: 3.0,
                                    value: _animationController.value,
                                  ),
                                  GradientCircularProgressIndicator(
                                      radius: 50.0,
                                      colors: [Colors.red,Colors.orange],
                                      strokeWidth:5,
                                      value: _animationController.value,
                                  ),
                                  GradientCircularProgressIndicator(
                                    colors: [Colors.red, Colors.orange],
                                    radius: 50.0,
                                    strokeWidth: 5.0,
                                    value: _animationController.value,
                                  ),
                                  GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan],
                                    radius: 50.0,
                                    strokeWidth: 5.0,
                                    strokeCapRound: true,
                                    value: CurvedAnimation(
                                        parent: _animationController,
                                        curve: Curves.decelerate)
                                        .value,
                                  ),
                                  TurnBox(
                                    turns: 1 / 8,
                                    child: GradientCircularProgressIndicator(
                                        colors: [Colors.red, Colors.orange, Colors.red],
                                        stops: [0.3,0.3,0.6],
                                        radius: 50.0,
                                        strokeWidth: 5.0,
                                        strokeCapRound: true,
                                        backgroundColor: Colors.red[50],
                                        totalAngle: 1.5 * pi,
                                        value: CurvedAnimation(
                                            parent: _animationController,
                                            curve: Curves.ease)
                                            .value),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: GradientCircularProgressIndicator(
                                        colors: [Colors.blue[700], Colors.blue[200]],
                                        radius: 50.0,
                                        strokeWidth: 3.0,
                                        strokeCapRound: true,
                                        backgroundColor: Colors.transparent,
                                        value: _animationController.value),
                                  ),
                                  GradientCircularProgressIndicator(
                                    colors: [
                                      Colors.red,
                                      Colors.amber,
                                    ],
                                    radius: 50.0,
                                    strokeWidth: 5.0,
                                    strokeCapRound: true,
                                    value: _animationController.value,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "${(_animationController.value * 100).toInt()}%",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: GradientCircularProgressIndicator(
                                  colors: [Colors.blue[700], Colors.blue[300]],
                                  radius: 100.0,
                                  strokeWidth: 20.0,
                                  value: _animationController.value,
                                  strokeCapRound: true,
                                ),
                              ),
                              //剪裁半圆
                              ClipRect(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  heightFactor: .5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: SizedBox(
                                      //width: 100.0,
                                      child: TurnBox(
                                        turns: .75,
                                        child: GradientCircularProgressIndicator(
                                          colors: [Colors.teal, Colors.cyan[500]],
                                          radius: 100.0,
                                          strokeWidth: 8.0,
                                          value: _animationController.value,
                                          totalAngle: pi,
                                          strokeCapRound: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      );
                    }
                )
             ],
           ),
         ),
       ),
    );
  }

}