import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget{

  final double strokeWidth;//粗细
  final double radius;//圆半径
  final bool strokeCapRound;//线是否是圆头
  final double value;//进度条的值，0-1
  final Color backgroundColor;
  final double totalAngle;//进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final List<Color> colors;//进度条背景色
  final List<double> stops;// 渐变色的终止点，对应colors属性


  GradientCircularProgressIndicator({
    this.strokeWidth,
    @required
    this.radius,
    this.strokeCapRound=false,
    this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle=2*pi,
    @required
    this.colors,
    this.stops
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme
          .of(context)
          .accentColor;
      _colors = [color, color];
    }
    var _stops = stops;
    if (_stops == null) {
       _stops=[0.5,0.5];
    }
    return Transform.rotate(
      angle: (-pi / 2.0 - _offset).toDouble(),
      child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors,
            stops: _stops
          )
      ),
    );
  }

}

class _GradientCircularProgressPainter extends CustomPainter {

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  _GradientCircularProgressPainter({
    this.strokeWidth: 10.0,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value
  });


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
//    if(radius!=null){
//      radius=Size.fromRadius(radius);
//    }
     double _offset =strokeWidth/2;
     double _value=(value??.0);
     _value = _value.clamp(.0, 1.0) * total;
     double _start = .0;
     if (strokeCapRound) {
       _start = asin(strokeWidth/ (size.width - strokeWidth));
     }
     Rect rect = Offset(_offset, _offset) & Size(
         size.width - strokeWidth,
         size.height - strokeWidth
     );

     var paint=Paint()
     ..strokeCap=strokeCapRound?StrokeCap.round:StrokeCap.butt
     ..style=PaintingStyle.stroke
     ..isAntiAlias=true
     ..strokeWidth=strokeWidth;
     // 先画背景
     if (backgroundColor != Colors.transparent) {
       paint.color = backgroundColor;
       canvas.drawArc(rect, _start, total, true, paint);
     }

     if(_value>0){
       paint.shader=SweepGradient(
           colors: colors,
           startAngle: 0.0,
           endAngle: _value,
           stops: stops
       ).createShader(rect);

       canvas.drawArc(rect, _start, _value, false, paint);

     }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}