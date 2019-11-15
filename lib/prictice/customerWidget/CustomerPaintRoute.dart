import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintRoute  extends StatelessWidget {
  const CustomPaintRoute ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("自绘制棋盘"),
          ),  
          body: Center(
             child:CustomPaint(
            size: Size(300, 300), //指定画布大小
            painter: Mypainter(),
          ),
          ),
    );
  }
}

class Mypainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double eWidth=size.width/15;
    double eHeight=size.height/15;
    var paint=new Paint()
        ..isAntiAlias=true
        ..style=PaintingStyle.fill
        ..color=Color(0x77cdb175);
    canvas.drawRect(Offset.zero&size, paint);
     //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;   
    for(int i=0;i<=15;i++){
      double dy=eWidth*i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }  
    for(int i=0;i<=15;i++){
      double dx=eHeight*i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }  
    paint
    ..style=PaintingStyle.fill
    ..color=Colors.black;
     canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
     //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}