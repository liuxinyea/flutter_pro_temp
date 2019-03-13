import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  var _words = <String>[];
  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    if(_words.length==0){
      return new Container(
        child: Center(
         child:new Column(
           mainAxisAlignment:MainAxisAlignment.center,
           children: <Widget>[
             new  SizedBox(
                 width: 24.0,
                 height: 24.0,
                 child: CircularProgressIndicator(strokeWidth: 2.0)
             ) ,
             new Text("加载中...",
                 style: TextStyle(
                   height:2.5
                 ),)
           ],
         )
        ),
      );
    }else{
      return new ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          if (index== _words.length-1) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)
                ),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
              );
            }
          }
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: 1.0),
      );
    }

  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 1)).then((e) {
      _words.insertAll(_words.length,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

}