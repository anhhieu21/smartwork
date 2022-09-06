import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwork/cubit/category/category_cubit.dart';
import 'package:smartwork/repository/category.dart';
import 'package:smartwork/repository/task.dart';
import 'package:smartwork/routes/routes.dart';
import 'package:smartwork/styles/theme.dart';

import 'cubit/task/task_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TaskService(),
        ),
        RepositoryProvider(
          create: (context) => CategoryService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TaskCubit(RepositoryProvider.of<TaskService>(context)),
          ),
          BlocProvider(
            create: (context) =>
                CategoryCubit(RepositoryProvider.of<CategoryService>(context)),
          )
        ],
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => primaryFocus?.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            onGenerateRoute: generateRoute,
          ),
        ),
      ),
    );
  }
}
