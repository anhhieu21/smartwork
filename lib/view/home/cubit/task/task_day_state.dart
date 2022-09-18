part of 'task_day_cubit.dart';

abstract class TaskDayState extends Equatable {
  const TaskDayState();

  @override
  List<Object> get props => [];
}

class TaskDayInitial extends TaskDayState {}

class TaskDayList extends TaskDayState {
  final List<Task> taskList;
  final DateTime dateTime;
  const TaskDayList(this.taskList, this.dateTime);

  @override
  List<Object> get props => [taskList, dateTime];
}
