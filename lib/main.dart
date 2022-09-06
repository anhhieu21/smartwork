import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/main_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartwork/models/category.dart';
import 'app.dart';
import 'models/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter<Category>(CategoryAdapter());
  await Hive.openBox<Task>('task');
  await Hive.openBox<Category>('category');
  Bloc.observer = MainBlocObserver();
  runApp(const MyApp());
}
