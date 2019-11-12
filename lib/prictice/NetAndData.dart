import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/color@theme/NavBar@Color.dart';

class PricticeDemo extends StatelessWidget {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this._context = context;
    return Container(
//      alignment: Alignment.center,
      child: new Wrap(
        spacing: 25,
        runSpacing: 10,
        children: <Widget>[
          getBtn("NAVBar@Color", NavBarColorRoute()),

        ],
      ),
    );
  }

  Widget getBtn(String btnName, Widget demoPage) {
    return new FlatButton(
      color: Colors.blue,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text(btnName),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {
        Navigator.push(
            _context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context,animation,secondaryAnimation){
                  return new FadeTransition(
                    opacity: animation,
                    child: demoPage,
                  );
                }
            )
        );
      },
    );
  }
}
