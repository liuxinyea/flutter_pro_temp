/*轮播图组件*/
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//图片数据列表
final List<String> imgList=[
  'assets/img/pic1.png',
  'assets/img/pic2.png'
];
/// 用给定的处理函数（`handler`）处理给定的列表数据（`list`），
/// 返回处理结果列表（`result`）。
List<T> worker<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, new AssetImage(list[i])));
  }
  return result;
}
class BannerView extends StatefulWidget{
  @override
  _BannerViewState createState() => _BannerViewState();
}
class _BannerViewState extends State<BannerView>{
  /// 当前页面的索引。
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      /*也可以使用Positioned定位子组件*/
      alignment: const FractionalOffset(0.5, 0.9),
      children: <Widget>[
        // carousel_slider包里的轮播组件（`CarouselSlider`）组件。
        CarouselSlider(
          // 使用自定义的工人`worker`方法生成一个容器组件列表。
          items:worker(imgList, (index,img){
               return new Container(
                   decoration: BoxDecoration(
                     image:new DecorationImage(
                         image: img,
                         // 适应属性，如何在框里展示图像。
                         // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                         fit: BoxFit.cover
                     )
                   ),
               );
          }),
            // 是否自动播放，默认为`false`。
            autoPlay: true,
            // 当前页面在视窗中占用的空间，默认为`0.8`。
            viewportFraction: 1.0,
            // 宽高比例，默认为`16/9`。
            aspectRatio:16/9,
            // 切换时当前页面逐渐变小，新页面逐渐变大直至完全替代当前页面，
            // 默认为`true`。
            distortion: false,
            // 视窗中页面更新时的回调函数。
            updateCallback: (index) {
              setState(() {
                _current = index;
              });
            },
        ),
        // TODO:实现“进度条”
        new Row(
          children: <Widget>[
            // 左边的空白部分，设置占2个弹性因子，高度为30.0以撑起“进度条”的高度。
            Expanded(
              // 柔性属性，用于此子组件的弹性因子。
              flex: 1,
              child: SizedBox(height: 30.0),
            ),
            Expanded(
              flex: 1,
              child: LinearProgressIndicator(
                  // 背景颜色（`backgroundColor `）属性，进度指示器的背景颜色。
                  backgroundColor: const Color(0xFFE1E1E1),
                 // 值颜色（`valueColor`）属性，指标的颜色是动画的值。
                  valueColor: AlwaysStoppedAnimation(Color(0xFF414141)),
                  // 值（`value `）属性，0.0～1.0对应于进度条当前进度。
                  value: (_current + 1) / imgList.length,
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(height: 30.0),
            )
          ],
        )
      ],
    );
  }
}