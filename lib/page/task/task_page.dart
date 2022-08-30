import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/cubit/task_cubit.dart';
import 'package:smartwork/models/task.dart';
import 'package:smartwork/styles/colors.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgPage,
      body: BlocBuilder<TaskCubit, TaskState>(
          bloc: BlocProvider.of<TaskCubit>(context)..getListTask(),
          builder: (context, state) {
            if (state is TaskData) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    return Text(item.title);
                  });
            } else {
              return const Center(
                child: Text('Empty'),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Task item = Task('B1', 'ok let', DateTime.now().toString(), 'doing');
        BlocProvider.of<TaskCubit>(context).addTask(item);
      }),
    );
  }
}
