import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

import 'package:smartwork/presentation/routes/routes_path.dart';
import 'package:smartwork/presentation/styles/colors.dart';
import 'package:smartwork/presentation/styles/text.dart';
import 'package:smartwork/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const styleTitle =
        TextStyle(fontWeight: FontWeight.w800, color: colorTitle, fontSize: 35);
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
              const Text('Create and', style: styleTitle),
              const Text('Check Daily Task', style: styleTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Task',
                    style: textStyleGoogle.copyWith(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(RoutePath.addTask),
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
