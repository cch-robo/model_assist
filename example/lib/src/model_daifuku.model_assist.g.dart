// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ModelAssistGenerator
// **************************************************************************

import 'package:example/src/model_daifuku.dart';

class DaifukuBase {
  Daifuku base;
  DaifukuBase(String name, String price) {
    base = Daifuku(name, price);
  }
  void display() {
    print('${base.namae} ${base.nedan} yen');
  }
}
