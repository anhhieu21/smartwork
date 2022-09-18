import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/repository/task.dart';

part 'task_by_type_state.dart';

class TaskByTypeCubit extends Cubit<TaskByTypeState> {
  final TaskService _taskService;
  TaskByTypeCubit(this._taskService) : super(TaskByTypeInitial());

  taskByCategory(String category) {
    final list = _taskService
        .getListTask()
        .where((e) => e.category == category)
        .toList();
    emit(TaskByTypeList(list));
  }
}
