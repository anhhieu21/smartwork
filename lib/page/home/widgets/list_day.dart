import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

class ListDay extends StatefulWidget {
  const ListDay({super.key});

  @override
  State<ListDay> createState() => _ListDayState();
}

class _ListDayState extends State<ListDay> {
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  @override
  void initState() {
    lastDayOfMonth = DateTime(now.month, now.day + 1, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(6, (index) {
          final currentDate = lastDayOfMonth.add(Duration(days: index));
          return ItemDay(
            index: index,
            currentDate: currentDate,
          );
        }),
      ),
    );
  }
}

class ItemDay extends StatelessWidget {
  final int index;
  final DateTime currentDate;
  const ItemDay({
    Key? key,
    required this.index,
    required this.currentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: index == 0 ? colorItemDay : colorGrey.shade300,
          boxShadow: index == 0
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
          Text(DateFormat.E().format(currentDate).toUpperCase(),
              style: textStyleGoogle.copyWith(
                  color: index == 0 ? colorGrey.shade200 : colorGrey)),
          Text(DateFormat.d().format(currentDate),
              style: textStyleGoogle.copyWith(
                  color: index == 0 ? colorWhite : colorGrey.shade600)),
        ],
      ),
    );
  }
}
