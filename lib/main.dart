import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app_iti/features/add_task/add_task.dart';
import 'package:tasky_app_iti/features/home_navigation_bar.dart';
import 'package:tasky_app_iti/features/start/start_widget_view.dart';

import 'core/styles/mytheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final userName = prefs.getString('userName');

  bool isLogin = (userName != null);

  runApp(MyApp(isLogin: isLogin,));
}

class MyApp extends StatelessWidget {
  bool isLogin ;
   MyApp({super.key,required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        StartWidgetView.routeName : (_) => const StartWidgetView(),
        HomeNavigationBar.routeName : (_) => const HomeNavigationBar(),
        AddTask.routeName : (_) => const AddTask(),
      },
      initialRoute: isLogin ? HomeNavigationBar.routeName : StartWidgetView.routeName,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}

