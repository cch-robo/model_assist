import 'package:model_assist_annotation/model_assist_annotation.dart';
import 'define_annotation_id.dart';

@ClassInfo(Sweets)
class Daifuku {
  @FieldInfo(ItemName)
  final String namae;

  @FieldInfo(ItemPrice)
  final String nedan;

  Daifuku(this.namae, this.nedan);
}

class Product {
  Product(this.name, this.price);
  String name;
  int price;
  void display() {
    print('$name $price yen');
  }
}
