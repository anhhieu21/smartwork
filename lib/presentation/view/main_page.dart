import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:smartwork/cubit.dart';
import 'view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _controller = TabController(
      initialIndex: 0, length: _buildScreens().length, vsync: this);

  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).getListTask();
    BlocProvider.of<CategoryCubit>(context).getCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: _buildScreens(),
      ),
      bottomNavigationBar:
          TabBar(controller: _controller, tabs: _navBarsItems()),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomePage(),
    const CategoriesPage(),
    const TaskPage(),
    const SettingPage()
  ];
}

List<Widget> _navBarsItems() {
  return [
    const Tab(
      icon: Icon(Ionicons.grid_outline),
    ),
    const Tab(
      icon: Icon(Ionicons.file_tray_full_outline),
    ),
    const Tab(
      icon: Icon(Ionicons.calendar_number_outline),
    ),
    const Tab(
      icon: Icon(Ionicons.person_outline),
    ),
  ];
}
