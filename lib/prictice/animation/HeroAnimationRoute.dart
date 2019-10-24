import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/animation/hero_animation_route_b.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero"),),
      body: Container(

          alignment: Alignment.topCenter,

          child:Listener(
            child:Hero(
              tag: "headImg",
              child: ClipOval(
                clipBehavior: Clip.hardEdge,
                child: Image.asset("./assets/img/aaa.jpg",width: 100.0,),
              ),
            ),
            onPointerDown: (details){
              Navigator.push(context,
//                  CupertinoPageRoute(
//                     builder: (context){
//                       return Scaffold(
//                        appBar: AppBar(title: Text("原图"),),
//                        body: HeroAnimationRouteB(),
//                      );
//                     }
//                  )
                  PageRouteBuilder(
                  pageBuilder: (context,animation,animation2){
                    return FadeTransition(opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(title: Text("原图"),),
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  }
              )
              );
            },
          )
      ) ,
    );
  }
}

