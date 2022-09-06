import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartwork/models/category.dart';

class CategoryService {
  Box<Category> categorys = Hive.box<Category>('category');
  List<Category> getListCategory() {
    return categorys.values.toList();
  }

  void addCategory(Category category) {
    categorys.add(category);
  }
}
