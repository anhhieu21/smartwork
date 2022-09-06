import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smartwork/cubit/index.dart';
import 'package:smartwork/page/task/add_task_page.dart';
import 'package:smartwork/routes/routes_path.dart';
import 'package:smartwork/styles/colors.dart';

const _kMaxCrossAxisExtent = 350.0;
const _kChildAspectRatio = 1.0;

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // int count = (size.width / _kMaxCrossAxisExtent).ceil();
    // final width = (size.width / count) - 24;

    return Scaffold(
      backgroundColor: colorBgPage,
      body: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
        if (state is TaskData) {
          return GridView.extent(
            maxCrossAxisExtent: _kMaxCrossAxisExtent,
            childAspectRatio: _kChildAspectRatio,
            physics: const ScrollPhysics(),
            children: List.generate(state.list.length, (index) {
              final item = state.list[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.read<TaskCubit>().removeTask(index);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: colorShadown,
                              offset: Offset(5, 8),
                              blurRadius: 8.0,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title),
                          Text(item.content),
                          Text(item.createdAt),
                          Text(item.tag),
                        ],
                      )),
                ),
              );
            }),
          );
        } else {
          return const Center(
            child: Text('Empty'),
          );
        }
      }),
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
