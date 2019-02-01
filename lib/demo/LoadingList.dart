import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_first_flutter_pro/view/LoadListView.dart';
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
        centerTitle:true,
        title: new Text("标题"
        ),
      ),
      body:   new InfiniteListView(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}