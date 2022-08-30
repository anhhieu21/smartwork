import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/repository/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskService _taskService;
  TaskCubit(this._taskService) : super(TaskInitial());
  void getListTask() async {
    emit(TaskData(list: _taskService.getListTask()));
  }

  void addTask(Task item) {
    _taskService.addTask(item);
    getListTask();
  }
}
