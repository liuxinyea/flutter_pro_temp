import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'this is title',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) :super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default value for toggle
  bool toggle = true;
  String _text='1111111111';
  void _toggle() {
    if (toggle) {
      _text="1111111111";
    } else {
      _text="22222222222";
    }
    setState(() {
      toggle = !toggle;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("标题"
        ),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child:new Text("文本是$_text"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}