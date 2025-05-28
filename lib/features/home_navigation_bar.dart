import 'package:flutter/material.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';
import 'package:tasky_app_iti/features/completed/presentation/completed_view.dart';
import 'package:tasky_app_iti/features/home/presentation/home_view.dart';
import 'package:tasky_app_iti/features/profile/presentation/profile_view.dart';
import 'package:tasky_app_iti/features/todo/presentation/todo_view.dart';

class HomeNavigationBar extends StatefulWidget {
  static String routeName = 'HomeNavigationBar';

  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int currentIndex = 0;

  final List<Widget> tabs = const [
    HomeView(),
    TodoView(),
    CompletedView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainPrimaryGreenColor,
        unselectedItemColor: grayDarkColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 24,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list,size: 24,),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle,size: 24,),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 24,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
