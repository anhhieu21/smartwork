import 'package:hive/hive.dart';
import 'package:smartwork/models/task.dart';

class TaskService {
  Box<Task> tasks = Hive.box<Task>('task');
  List<Task> getListTask() {
    return tasks.values.toList();
  }

  void addTask(Task task) {
    tasks.add(task);
  }
}
