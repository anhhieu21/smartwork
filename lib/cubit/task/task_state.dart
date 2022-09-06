part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskData extends TaskState {
  final List<Task> list;
  const TaskData({required this.list});

  @override
  List<Object> get props => [list];
}
