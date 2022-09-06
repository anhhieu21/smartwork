import 'package:flutter/material.dart';
import 'package:smartwork/page/main_page.dart';
import 'package:smartwork/page/task/add_task_page.dart';
import 'package:smartwork/routes/routes_path.dart';

final Map<String, Widget Function(dynamic)> routesMapping = {
  RoutePath.main: (arguments) => const MainPage(),
  RoutePath.addTask: (arguments) => const AddTaskPage(),
};

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  if (routesMapping[settings.name] != null) {
    return MaterialPageRoute(
        builder: (context) => routesMapping[settings.name]!(arguments),
        settings: settings);
  } else {
    throw ErrorDescription('Invalid route: ${settings.name}');
  }
}
