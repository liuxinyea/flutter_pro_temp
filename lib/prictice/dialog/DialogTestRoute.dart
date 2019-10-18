//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogTestRoute();
  }
}

class _DialogTestRoute extends State<DialogTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _context=context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Wrap(
        spacing: 5,
        children: <Widget>[
          FlatButton(
            highlightColor: Colors.redAccent,
            color: Colors.teal,
            textColor: Colors.white,
            child: Text("AlertDialog"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog1();
              if (delete) {
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              }
            },
          ),
          FlatButton(
            highlightColor: Colors.redAccent,
            color: Colors.teal,
            textColor: Colors.white,
            child: Text("SimpleDialog"),
            onPressed: () {
              changeLanguage();
            },
          ),
          FlatButton(
            highlightColor: Colors.redAccent,
            color: Colors.teal,
            textColor: Colors.white,
            child: Text("ListDialog"),
            onPressed: () {
              showListDialog();
            },
          ),
          FlatButton(
            highlightColor: Colors.redAccent,
            color: Colors.teal,
            textColor: Colors.white,
            child: Text("customerDialog"),
            onPressed: () {
              showCustomerDialog();
            },
          )
        ],
      ),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showCustomDialog<bool>(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: _context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: _context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<void> showCustomerDialog() async {
     print(_context);
    int index = await showDialog<int>(
      context: _context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            Text("请选择"),
            Radio(groupValue: null, onChanged: (int value) {
              
            }, value: 1,),
            StatefulBuilder(
              builder: (BuildContext context, _setState) {
                return Switch(
                  value: _switchSelected, //当前状态
                  onChanged: (value) {
                    //重新构建页面
                    _setState(() {
                      _switchSelected = value;
                    });
                  },
                );
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return UnconstrainedBox(
          //在某个方向上不加约束
          // constrainedAxis: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 280, maxHeight: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
        ;
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }
}

class StatefulBuilder extends StatefulWidget {
  final StatefulWidgetBuilder builder;

  const StatefulBuilder({Key key, @required this.builder})
      : assert(builder != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StatefulBuilderState();
  }
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //回调传入的builder方法，将当前的context和setState传出
    return widget.builder(context, setState);
  }
}
