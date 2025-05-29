import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app_iti/core/components/task_component.dart';

import '../../../../core/models/task_model.dart';
import '../../../../core/styles/colors.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  final List<TaskModel> highPriorityTasks;
  final Function() saveTasks;
  final Function(TaskModel task, bool? value) onChanged;

  const HighPriorityTasksWidget({
    super.key,
    required this.highPriorityTasks,
    required this.saveTasks,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "High Priority Tasks",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: mainPrimaryGreenColor,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height:  highPriorityTasks.isNotEmpty? 180 : 20,
                child: ListView.builder(
                  itemCount: highPriorityTasks.length,

                  itemBuilder: (context, index) {
                    final task = highPriorityTasks[index];
                    return  TaskComponent(
                      isCompletedOrTodo: false,
                      task: task,
                      onChanged: (value) {
                      onChanged(task, value);
                      saveTasks();
                    },);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF6E6E6E)),
              ),
              child: SvgPicture.asset(
                'assets/images/arrow-up-right.svg',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
