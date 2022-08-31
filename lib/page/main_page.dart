import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smartwork/cubit/task_cubit.dart';

import 'package:smartwork/page/home/home_page.dart';
import 'package:smartwork/page/task/task_page.dart';
import 'package:smartwork/styles/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaskCubit>(context).getListTask();
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 350),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomePage(),
    const TaskPage(),
    const TaskPage(),
    const TaskPage()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.grid_outline),
      activeColorPrimary: colorItemNav,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.file_tray_full_outline),
      activeColorPrimary: colorItemNav,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.calendar_number_outline),
      activeColorPrimary: colorItemNav,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.person_outline),
      activeColorPrimary: colorItemNav,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
