import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/cubit/task_cubit.dart';

import 'item_task.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 2.2,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskData) {
            final list = state.list;
            return ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  list.length,
                  (index) => ItemTask(
                        item: list[index],
                      )),
            );
          } else {
            return const ItemTask();
          }
        },
      ),
    );
  }
}
