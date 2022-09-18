import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartwork/index.dart';

import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';
import 'package:smartwork/view/home/cubit/task/task_day_cubit.dart';

class ListDay extends StatefulWidget {
  const ListDay({super.key});

  @override
  State<ListDay> createState() => _ListDayState();
}

class _ListDayState extends State<ListDay> {
  final now = DateTime.now();
  final ScrollController controller = ScrollController();
  final itemKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // controller.jumpTo(itemKey.currentState.)
    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return SizedBox(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: List.generate(7, (index) {
          final currentDate = firstDayOfWeek.add(Duration(days: index));
          return ItemDay(
            index: index,
            currentDate: currentDate,
          );
        }),
      ),
    );
  }
}

class ItemDay extends StatefulWidget {
  final int index;
  final DateTime currentDate;
  const ItemDay({
    Key? key,
    required this.index,
    required this.currentDate,
  }) : super(key: key);

  @override
  State<ItemDay> createState() => _ItemDayState();
}

class _ItemDayState extends State<ItemDay> {
  bool isDayNow = false;
  @override
  void initState() {
    isDayNow = Formatter.dateTime(widget.currentDate) ==
        Formatter.dateTime(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDayCubit, TaskDayState>(
      builder: (context, state) {
        if (state is TaskDayList) {
          isDayNow = Formatter.dateTime(state.dateTime) ==
              Formatter.dateTime(widget.currentDate);

          return GestureDetector(
            onTap: () {
              BlocProvider.of<TaskDayCubit>(context)
                  .listTaskDay(widget.currentDate);
            },
            child: Container(
              width: 50,
              alignment: Alignment.center,
              margin:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: isDayNow ? colorItemDay : colorGrey.shade300,
                  boxShadow: isDayNow
                      ? [
                          BoxShadow(
                              color: colorGrey.shade300,
                              offset: const Offset(4, 6),
                              blurRadius: 10.0)
                        ]
                      : null),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat.E().format(widget.currentDate).toUpperCase(),
                      style: textStyleGoogle.copyWith(
                          color: isDayNow ? colorGrey.shade200 : colorGrey)),
                  Text(DateFormat.d().format(widget.currentDate),
                      style: textStyleGoogle.copyWith(
                          color: isDayNow ? colorWhite : colorGrey.shade600)),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
