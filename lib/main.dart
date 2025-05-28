import 'package:flutter/material.dart';
import 'package:tasky_app_iti/features/add_task/add_task.dart';
import 'package:tasky_app_iti/features/home_navigation_bar.dart';
import 'package:tasky_app_iti/features/start/start_widget_view.dart';

import 'core/styles/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        StartWidgetView.routeName : (_) => const StartWidgetView(),
        HomeNavigationBar.routeName : (_) => const HomeNavigationBar(),
        AddTask.routeName : (_) => const AddTask(),
      },
      initialRoute: StartWidgetView.routeName,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}

