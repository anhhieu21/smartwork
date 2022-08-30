import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/repository/task.dart';
import 'package:smartwork/styles/theme.dart';

import 'cubit/task_cubit.dart';
import 'page/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskService(),
      child: BlocProvider(
        create: (context) =>
            TaskCubit(RepositoryProvider.of<TaskService>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
