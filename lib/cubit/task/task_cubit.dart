import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/index.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/repository/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskService _taskService;
  TaskCubit(this._taskService) : super(TaskInitial());
  void getListTask({String? dateTime, Sort? sort}) async {
    List<Task> list = [];
    if (dateTime != null) {
      list = _taskService
          .getListTask()
          .where((e) => Formatter.dateTime(e.createdAt) == dateTime)
          .toList();
    } else if (sort != null) {
      list = _taskService.getListTask();
      if (sort == Sort.oldest) {
        list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      } else {
        list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    } else {
      list = _taskService.getListTask();
    }
    emit(TaskData(list: list));
  }

  void addTask(Task item) {
    _taskService.addTask(item);
    getListTask();
  }

  void removeTask(int index) {
    _taskService.removeTask(index);
    getListTask();
  }
}
