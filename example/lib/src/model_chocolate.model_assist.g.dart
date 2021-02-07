// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ModelAssistGenerator
// **************************************************************************

import 'package:example/src/model_chocolate.dart';

class ChocolateBase {
  Chocolate base;
  ChocolateBase(String name, int price) {
    base = Chocolate(name, price);
  }
  void display() {
    print('${base.name} ${base.price} yen');
  }
}
