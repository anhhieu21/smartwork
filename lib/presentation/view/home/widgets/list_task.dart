import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/view.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 2.2,
      child: BlocBuilder<TaskDayCubit, TaskDayState>(
        builder: (context, state) {
          if (state is TaskDayList) {
            final list = state.taskList;
            return Row(
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
