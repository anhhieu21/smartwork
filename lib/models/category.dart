import 'package:hive_flutter/hive_flutter.dart';
part 'category.g.dart';
@HiveType(typeId: 2)
class Category{
    @HiveField(0)
  String title;

  @HiveField(1)
  String qty;


  Category(
     this.title,
     this.qty,
 );
}