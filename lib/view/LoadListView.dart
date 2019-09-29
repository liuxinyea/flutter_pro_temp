import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
/*包含下拉刷新和加载更多的列表*/
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  var _words = <String>[];
  @override
  // ignore: must_call_super
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
      return new RefreshIndicator(
          child: new ListView.separated(
            itemCount: _words.length,
            itemBuilder: (context, index) {
              /*index是代表当前显示或者渲染第几条数据，判断最后一条数据的情况*/
              print("list$index");
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
          ),
          onRefresh: _onRefresh
      );
    }

  }
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds:2)).then((e) {
      _words.clear();
      _words.insertAll(_words.length,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
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