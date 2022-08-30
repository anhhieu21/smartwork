import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/main_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'models/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  Bloc.observer = MainBlocObserver();
  runApp(const MyApp());
}
