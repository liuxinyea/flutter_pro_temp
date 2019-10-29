import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_first_flutter_pro/demo/ListPage.dart';
import 'package:my_first_flutter_pro/host.dart';
import 'package:my_first_flutter_pro/main.dart';
import 'package:my_first_flutter_pro/prictice/Provider/ProviderRoute.dart';
import 'package:my_first_flutter_pro/prictice/color@theme/PricticeDemo.dart';
import 'package:my_first_flutter_pro/prictice/inheritedWidget/InheritedWidgetTestRoute.dart';
class Router{
   final Map _map={
      '/home': HostPage(),
      '/login': LoginHomePage(),
      '/list':  ListPage(),
      '/inherited_widget':  InheritedWidgetTestRoute(),
      '/provider_demo':  ProviderRoute(),
    } ;
  
  static Map pages;
  
  Router(){
    if(pages==null){
      pages={};
    }
    _map.forEach((router,page){
        pages[router]=(BuildContext context) =>page.runtimeType;
     });
  }
   Map routers(){
     print(pages['/home'].runtimeType);
     return {
      '/home':(BuildContext context) => HostPage(),
      '/login': (BuildContext context) =>LoginHomePage(),
      '/list':  (BuildContext context) =>ListPage(),
      '/inherited_widget':  (BuildContext context) =>InheritedWidgetTestRoute(),
      '/provider_demo':  (BuildContext context) =>ProviderRoute(),
      '/nav_bar':  (BuildContext context) =>PricticeDemo(),

    } as LinkedHashMap; 
   }
   Widget getPage(String pageName){
       return _map[pageName];
   }

}