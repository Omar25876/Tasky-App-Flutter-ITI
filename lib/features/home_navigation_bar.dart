import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        items: [
          BottomNavigationBarItem(
            icon: currentIndex !=0 ?
            SvgPicture.asset('assets/images/homeIcon.svg',width: 24,height: 24,)
            :SvgPicture.asset('assets/images/homeIcon.svg',width: 24,height: 24,colorFilter: ColorFilter.mode(mainPrimaryGreenColor, BlendMode.srcIn),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  currentIndex !=1 ?
            SvgPicture.asset('assets/images/todoIcon.svg',width: 24,height: 24,)
            :SvgPicture.asset('assets/images/todoIcon.svg',width: 24,height: 24,colorFilter: ColorFilter.mode(mainPrimaryGreenColor, BlendMode.srcIn)),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: currentIndex !=2 ?
            SvgPicture.asset('assets/images/completeIcon.svg',width: 24,height: 24,)
            : SvgPicture.asset('assets/images/completeIcon.svg',width: 24,height: 24,colorFilter: ColorFilter.mode(mainPrimaryGreenColor, BlendMode.srcIn)),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon:  currentIndex !=3 ?
            SvgPicture.asset('assets/images/profileIcon.svg',width: 24,height: 24,)
            :  SvgPicture.asset('assets/images/profileIcon.svg',width: 24,height: 24,colorFilter: ColorFilter.mode(mainPrimaryGreenColor, BlendMode.srcIn)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
