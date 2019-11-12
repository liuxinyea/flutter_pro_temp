import 'package:flutter/material.dart';

class FileOperationRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FileOperationRouteState();
  }

}

class _FileOperationRouteState  extends State<FileOperationRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
    );
  }

}