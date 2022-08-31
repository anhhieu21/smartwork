import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartwork/cubit/task_cubit.dart';
import 'package:smartwork/page/home/widgets/category_task.dart';
import 'package:smartwork/page/home/widgets/item_task.dart';
import 'package:smartwork/page/home/widgets/list_day.dart';
import 'package:smartwork/page/home/widgets/list_task.dart';

import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';

const urlAvatar =
    'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgPage,
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(urlAvatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Solomon Ares',
                    style: textStyleGoogle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Text('Good morning'),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.notifications_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create and',
                style: textStyleGoogle.copyWith(
                    fontWeight: FontWeight.w800, fontSize: 35),
              ),
              Text(
                'Check Daily Task',
                style: textStyleGoogle.copyWith(
                    fontWeight: FontWeight.w800, fontSize: 35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Task',
                    style: textStyleGoogle.copyWith(fontSize: 16),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Ionicons.add))
                ],
              ),
              const ListDay(),
              const ListTask(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category Task',
                      style: textStyleGoogle.copyWith(fontSize: 16),
                    ),
                    Text(
                      'See all',
                      style: textStyleGoogle.copyWith(
                          fontSize: 14, color: colorGrey),
                    ),
                  ],
                ),
              ),
              const CategoryTask()
            ],
          ),
        ),
      ),
    );
  }
}
