import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasky_app_iti/core/models/task_model.dart';

import '../../../../core/styles/colors.dart';

class AchievedTasks extends StatelessWidget {
  List<TaskModel> tasks;
  List<TaskModel> achievedTasks;
   AchievedTasks({super.key, required this.tasks, required this.achievedTasks});


  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Achieved Tasks",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "${achievedTasks.length} Out of ${tasks.length}  Done",
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: grayDarkColor),
                ),
              ],
            ),
          ),

          CircularPercentIndicator(
            radius: 28.0,
            lineWidth: 5.0,
            percent: tasks.isEmpty
                ? 0
                : achievedTasks.length / tasks.length,
            center: Text(
              "${tasks.isEmpty ? 0 : ((achievedTasks.length / tasks.length) * 100).toInt()}%",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            progressColor: mainPrimaryGreenColor,
            backgroundColor: grayLightColor,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
    ;
  }
}
