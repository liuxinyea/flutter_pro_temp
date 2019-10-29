import 'dart:math';

import 'package:flutter/material.dart';

/*订阅者回调签名*/
typedef void EventCallback(arg);

class EventBus{
  //私有构造函数
  EventBus._internal();

  static EventBus _singleton=new EventBus._internal();

  factory EventBus()=>_singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap=new Map<Object,List<EventCallback>>();

  void on(eventName,EventCallback f){
     if(eventName==null||f==null) return;
     _emap[eventName]??=new List<EventCallback>();
     _emap[eventName].add(f);
  }
  //移除订阅者
  void off(eventName,[EventCallback f]){
     var list=_emap[eventName];
     if (eventName == null || list == null) return;
     if(f==null){
         _emap[eventName]=null;
     }else{
        list.remove(f);
     }
  }

  void emit(eventName,[arg]){
     var list=_emap[eventName];
     if(list==null) return;
     int len=list.length-1;
     //反向遍历，防止订阅者在回调中移除自身带来的下标错位
     for(var i=len;i>-1;--i){
       list[i](arg);
     }
  }
}

