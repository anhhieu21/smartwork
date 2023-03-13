import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/domain/repository/task.dart';
import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/utils/formatter.dart';

part 'task_day_state.dart';

class TaskDayCubit extends Cubit<TaskDayState> {
  final TaskService _taskService;

  TaskDayCubit(this._taskService) : super(TaskDayInitial());

  listTaskDay(DateTime dateTime) {
    final date = Formatter.dateTime(dateTime);
    final list = _taskService
        .getListTask()
        .where((e) => Formatter.dateTime(e.createdAt) == date)
        .toList();
    emit(TaskDayList(list, dateTime));
  }
}
