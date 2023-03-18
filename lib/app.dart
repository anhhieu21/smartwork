import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:smartwork/domain/repository/category.dart';
import 'package:smartwork/domain/repository/task.dart';
import 'cubit.dart';
import 'presentation/routes/routes.dart';
import 'view.dart';

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
          BlocProvider(create: (context) => AppCubit()..darkMode(false)),
          BlocProvider(
              create: (context) =>
                  TaskCubit(RepositoryProvider.of<TaskService>(context))),
          BlocProvider(
              create: (context) => CategoryCubit(
                  RepositoryProvider.of<CategoryService>(context))),
          BlocProvider(create: (context) => TitleCubit()..titleDateTime()),
          BlocProvider(
              create: (context) =>
                  TaskDayCubit(RepositoryProvider.of<TaskService>(context))
                    ..listTaskDay(DateTime.now()))
        ],
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => primaryFocus?.unfocus(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state is AppTheme) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: state.theme,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('vi', 'VN'),
                  ],
                  onGenerateRoute: generateRoute,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
