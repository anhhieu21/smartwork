import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:smartwork/cubit.dart';
import 'package:smartwork/models.dart';
import 'package:smartwork/presentation/common/tag.dart';
import 'package:smartwork/presentation/routes/routes_path.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/utils/formatter.dart';
import 'package:smartwork/view.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final DateTime initialDate = DateTime.now();

  _showDatePicket(BuildContext context) async {
    DateTime? selectDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2023),
        cancelText: 'Show all',
        helpText: 'Select date',
        confirmText: 'Show only',
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (selectDate != null) {
      _selectDate(dateTime: selectDate);
    } else {
      _selectDate();
    }
  }

  _selectDate({DateTime? dateTime}) {
    final provider = BlocProvider.of<TaskCubit>(context);
    BlocProvider.of<TaskCubit>(context);
    if (dateTime != null) {
      provider.getListTask(dateTime: Formatter.dateTime(dateTime));
    } else {
      provider.getListTask();
    }
  }

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
        actions: [
          IconButton(
              onPressed: () => _showDatePicket(context),
              icon: const Icon(Ionicons.calendar))
        ],
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
      floatingActionButton: FabMenu(distance: 80.0, children: [
        ActionButton(
          onPressed: () => _sortList(Sort.oldest),
          backgroundColor: colorItemNav,
          icon: const Icon(Ionicons.arrow_down),
        ),
        ActionButton(
          onPressed: () => _sortList(Sort.latest),
          backgroundColor: colorItemNav,
          icon: const Icon(Ionicons.arrow_up),
        ),
        ActionButton(
          onPressed: () => _addTask(),
          backgroundColor: colorWork,
          icon: const Icon(
            Ionicons.pencil_outline,
          ),
        ),
      ]),
    );
  }

  _addTask() {
     PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      screen: const AddTaskPage(),
      withNavBar: true,
      settings: const RouteSettings(name: RoutePath.addTask),
    );
  }

  _sortList(Sort sort) {
    context.read<TaskCubit>().getListTask(sort: sort);
  }
}
