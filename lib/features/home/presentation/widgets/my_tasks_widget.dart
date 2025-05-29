import 'package:flutter/material.dart';
import '../../../../core/components/task_component.dart';
import '../../../../core/models/task_model.dart';
import '../../../../core/styles/colors.dart';

class MyTasksWidget extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function() saveTasks;
  final Function(TaskModel task, bool? value) onChanged;

  const MyTasksWidget({
    super.key,
    required this.tasks,
    required this.saveTasks,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Tasks",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child:     TaskComponent(
                isCompletedOrTodo: false,
                task: task,
                onChanged: (value) {
                onChanged(task, value);
                saveTasks();
              },),
            );
          },
        ),
      ],
    );
  }
}
