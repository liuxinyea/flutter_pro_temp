import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/prictice/animation/HeroAnimationRoute.dart';
import 'package:my_first_flutter_pro/prictice/animation/ScaleAnimationRoute.dart';
import 'package:my_first_flutter_pro/prictice/animation/animation_swicher_route.dart';
import 'package:my_first_flutter_pro/prictice/animation/stagger_route.dart';
import 'package:my_first_flutter_pro/prictice/color@theme/NavBar@Color.dart';
import 'package:my_first_flutter_pro/prictice/dialog/DialogTestRoute.dart';
import 'package:my_first_flutter_pro/prictice/event/EventBusTestRoute.dart';
import 'package:my_first_flutter_pro/prictice/event/GestureDetectorTest.dart';
import 'package:my_first_flutter_pro/prictice/event/ListenerTest.dart';
import 'package:my_first_flutter_pro/prictice/event/notification/CustomerNotification.dart';
import 'package:my_first_flutter_pro/prictice/event/notification/NotificationRoute.dart';
import 'package:my_first_flutter_pro/prictice/future/FutureTestRoute.dart';
import 'package:my_first_flutter_pro/prictice/future/StreamTestRoute.dart';
import 'ThemeDemo.dart';

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
          getBtn("Theme", ThemeTestRoute()),
          getBtn("Future", FutureTestRoute()),
          getBtn("Stream", StreamTestRoute()),
          getBtn("Dialog", DialogTestRoute()),
          getBtn("Event", ListenerTestRoute()),
          getBtn("GetureDetector", GestureDetectorTestRoute()),
          getBtn("EventBus", EventBusTestRoute()),
          getBtn("Notification", NotificationTestRoute()),
          getBtn("MyNotification", CustomerNotificationRoute()),
          getBtn("ScaleAnimation", ScaleAnimationRoute()),
          getBtn("HeroAnimation", HeroAnimationRoute()),
          getBtn("StaggerAnimation", StaggerRoute()),
          getBtn("AnimationSwicher", AnimationSwicherRoute()),
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
