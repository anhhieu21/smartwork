import 'package:hive/hive.dart';

import 'package:smartwork/models.dart';

class TaskService {
  Box<Task> tasks = Hive.box<Task>('task');

  List<Task> getListTask() {
    return tasks.values.toList();
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.deleteAt(index);
  }
}
