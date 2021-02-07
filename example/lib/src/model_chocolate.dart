import 'package:model_assist_annotation/model_assist_annotation.dart';
import 'define_annotation_id.dart';

@ClassInfo(Sweets)
class Chocolate {
  @FieldInfo(ItemName)
  final String name;

  @FieldInfo(ItemPrice)
  final int price;

  Chocolate(this.name, this.price);
}
