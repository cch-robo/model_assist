//
// このサンプルを実行するには、example ディレクトリで
// 下記コマンドで、build_runner を起動し、
// pub run build_runner build --delete-conflicting-outputs[A
// dart lib/main.dart を実行してください。

// コードファイルジェネレート前用
import 'package:example/src/model_daifuku.dart';
import 'package:example/src/model_chocolate.dart';

/*
// コードファイルジェネレート後用
import 'package:example/src/model_daifuku.model_assist.g.dart';
import 'package:example/src/model_chocolate.model_assist.g.dart';
*/

void main() {

  // コードファイルジェネレート前用
  final Daifuku daifuku = Daifuku('大福', '100');
  final Chocolate chocolate = Chocolate('Milk Chocolate', 120);
  final Product daifukuProduct = Product(daifuku.namae, int.parse(daifuku.nedan));
  final Product chocolateProduct = Product(chocolate.name, chocolate.price);
  chocolateProduct.display();
  daifukuProduct.display();

/*
  // コードファイルジェネレート後用
  final DaifukuBase daifukuBase = DaifukuBase('大福', '100');
  final ChocolateBase chocolateBase = ChocolateBase('Milk Chocolate', 120);
  daifukuBase.display();
  chocolateBase.display();
*/
}
