import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:smartwork/cubit.dart';
import 'package:smartwork/domain/repository/task.dart';
import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/common/tag.dart';
import 'package:smartwork/presentation/routes/routes_path.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/view.dart';

class TaskByCategory extends StatelessWidget {
  final String category;
  const TaskByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final listCategory =
        context.select((CategoryCubit categoryCubit) => categoryCubit.state);
    return BlocProvider(
        create: (_) =>
            TaskByTypeCubit(RepositoryProvider.of<TaskService>(context))
              ..taskByCategory(category),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              PopupMenuButton<Category>(
                icon: const Icon(Ionicons.filter),
                color: colorGrey.shade300,
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                itemBuilder: (ct) {
                  final list = listCategory is CategoryData
                      ? listCategory.categorys
                      : [] as List<Category>;
                  return List.generate(
                      list.length,
                      (index) => PopupMenuItem(
                            onTap: () => ct
                                .read<TaskByTypeCubit>()
                                .taskByCategory(list[index].title),
                            child: Text(list[index].title),
                          ));
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: BlocBuilder<TaskByTypeCubit, TaskByTypeState>(
                  builder: (context, state) {
                if (state is TaskByTypeList) {
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
        ));
  }
}
