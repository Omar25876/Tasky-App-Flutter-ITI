import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';
import 'package:tasky_app_iti/features/add_task/add_task.dart';
import 'package:tasky_app_iti/features/home/presentation/widgets/achieved_tasks_widget.dart';
import 'package:tasky_app_iti/features/home/presentation/widgets/header_widget.dart';
import 'package:tasky_app_iti/features/home/presentation/widgets/high_priority_tasks_widget.dart';
import 'package:tasky_app_iti/features/home/presentation/widgets/my_tasks_widget.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/models/task_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TaskModel> tasks = [];
  String? username;


  Future<void> _loadTasks() async {
    final loadedTasks = await SharedPrefHelper.getTasks();
    final loadedUserName = await SharedPrefHelper.getUserName();

    setState(() {
      tasks = loadedTasks;
      username = loadedUserName;
    });
  }

  Future<void> saveTasks() async {
    await SharedPrefHelper.saveTasks(
      tasks,
    );
  }

  int x = 0;
  @override
  Widget build(BuildContext context) {
    if(x==0){
      _loadTasks();
      x++;
    }


    List<TaskModel> achievedTasks = tasks
        .where((task) => task.isCompleted == true)
        .toList();
    List<TaskModel> highPriorityTasks = tasks
        .where((task) => task.isHighPriority == true)
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(username: username??'',),
                SizedBox(height: 16),
                AchievedTasks(tasks: tasks, achievedTasks: achievedTasks,),
                SizedBox(height: 8),

                HighPriorityTasksWidget(
                  highPriorityTasks: highPriorityTasks,
                  saveTasks: saveTasks,
                  onChanged: (task, value) {
                    setState(() {
                      task.isCompleted = value;
                    });


                  },
                ),

                SizedBox(height: 24),

                MyTasksWidget(
                  tasks: tasks,
                  saveTasks: saveTasks,
                  onChanged: (task, value) {
                    setState(() {
                      task.isCompleted = value;
                    });
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AddTask.routeName),
        backgroundColor: mainPrimaryGreenColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        icon: const Icon(Icons.add, color: whiteColor, size: 18),
        label: Text(
          "Add New Task",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
