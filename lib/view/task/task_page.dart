import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smartwork/contants/tag.dart';
import './../view.dart';

import 'package:smartwork/cubit/index.dart';
import 'package:smartwork/view/task/widgets/item_task.dart';
import 'package:smartwork/routes/routes_path.dart';
import 'package:smartwork/styles/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(
          'All task',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: colorTitle, fontSize: 18),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Where there is a will, there is a way.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
              Text('- Pauline Kael -',
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            if (state is TaskData) {
              return MasonryGridView.extent(
                  maxCrossAxisExtent: kMaxCrossAxisExtent,
                  physics: const ScrollPhysics(),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    return ItemTask(item: item);
                  });
            } else {
              return const Center(
                child: Text('Empty'),
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: colorGrey.withOpacity(0.5),
        elevation: 0,
        onPressed: () {
          pushNewScreenWithRouteSettings(
            context,
            screen: const AddTaskPage(),
            withNavBar: true,
            settings: const RouteSettings(name: RoutePath.addTask),
          );
        },
        child: const Icon(
          Ionicons.pencil_outline,
          color: colorBlack,
        ),
      ),
    );
  }
}
