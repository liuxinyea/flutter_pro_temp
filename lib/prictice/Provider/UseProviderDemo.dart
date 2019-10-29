import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:my_first_flutter_pro/prictice/Provider/Provider.dart';

class Item{
  int count;

  double price;

  Item({@required this.price,@required this.count});

}

class CartModel extends MyChangeNotifier{
   final List<Item> _items=[];

   UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  double get totalPrice=>
      _items.fold(0, (value,item)=>value+item.count*item.price);

  void add(Item item){
    _items.add(item);
    notifyListener();
  }
}