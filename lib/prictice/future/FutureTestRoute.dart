import 'package:flutter/material.dart';

class FutureTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FutureTestRoute();
  }
}

class _FutureTestRoute extends State<FutureTestRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.white,
      child:Column(
        children: <Widget>[
          AppBar(
             title: Text("FutureTest"),
          ),
          Center(
            heightFactor: 10.0,
            child: FutureBuilder(
              future: mockNetworkData(),
               builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                         return Text("Error: ${snapshot.error}",
                                    style: TextStyle(color: Colors.red, fontSize: 16),
                                  );
                    } else {
                           return Text(
                               "Contents: ${snapshot.data}",
                                style: TextStyle(color: Colors.red, fontSize: 16),
                           );
               }
    } else {
    return CircularProgressIndicator();
    }
    },
    ),
    ),

    ],
    )
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 3), () => "我是网络数据！");
  }
}
