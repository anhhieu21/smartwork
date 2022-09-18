import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smartwork/routes/routes_path.dart';
import 'package:smartwork/view/home/widgets/category_task.dart';
import 'package:smartwork/view/home/widgets/label_category.dart';
import 'package:smartwork/view/home/widgets/list_day.dart';
import 'package:smartwork/view/home/widgets/list_task.dart';
import './../view.dart';

import 'package:smartwork/styles/colors.dart';
import 'package:smartwork/styles/text.dart';
import 'package:smartwork/view/home/widgets/titel_app_bar.dart';
import 'package:smartwork/view/task/add_task_page.dart';

const urlAvatar =
    'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
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
                    fontWeight: FontWeight.w800,
                    color: colorTitle,
                    fontSize: 35),
              ),
              Text(
                'Check Daily Task',
                style: textStyleGoogle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorTitle,
                    fontSize: 35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Task',
                    style: textStyleGoogle.copyWith(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () => pushNewScreenWithRouteSettings(
                            context,
                            screen: const AddTaskPage(),
                            withNavBar: false,
                            settings:
                                const RouteSettings(name: RoutePath.addTask),
                          ),
                      icon: const Icon(Ionicons.add))
                ],
              ),
              const ListDay(),
              const ListTask(),
              LabelCategory(
                isSeeAll: true,
              ),
              const CategoryTask()
            ],
          ),
        ),
      ),
    );
  }
}
