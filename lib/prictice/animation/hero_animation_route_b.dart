import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Hero(
          tag: "headImg", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset("./assets/img/aaa.jpg"),
        ),
      ),
    );
  }
}
