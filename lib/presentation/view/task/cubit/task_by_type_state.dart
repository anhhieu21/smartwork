part of 'task_by_type_cubit.dart';

abstract class TaskByTypeState extends Equatable {
  const TaskByTypeState();

  @override
  List<Object> get props => [];
}

class TaskByTypeInitial extends TaskByTypeState {}

class TaskByTypeList extends TaskByTypeState {
  final List<Task> list;
  const TaskByTypeList(this.list);

  @override
  List<Object> get props => [list];
}
