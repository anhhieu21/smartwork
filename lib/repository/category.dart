import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartwork/models/category.dart';
import 'package:smartwork/models/task.dart';

class CategoryService {
  Box<Category> categorys = Hive.box<Category>('category');
  Box<Task> tasks = Hive.box<Task>('task');

  List<Category> getListCategory() {
    return categorys.values.toList();
  }

  void addCategory(Category category) {
    categorys.add(category);
  }

  void updateCategory(String title) {
    final list = getListCategory();
    final index = list.indexWhere((e) => e.title == title);
    final lengthTasks =
        tasks.values.toList().where((e) => e.category == title).length;
    Category category = Category(title, lengthTasks.toString());
    categorys.put(index, category);
  }

  void removeCategory(int index) {
    categorys.deleteAt(index);
  }
}
