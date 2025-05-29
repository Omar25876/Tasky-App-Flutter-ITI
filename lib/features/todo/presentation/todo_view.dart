import 'package:flutter/material.dart';

import '../../../core/components/task_component.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/models/task_model.dart';
import '../../../core/styles/colors.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List<TaskModel> allTasks = [];

  Future<void> _loadTasks() async {
    final loadedTasks = await SharedPrefHelper.getTasks();
    setState(() {
      allTasks = loadedTasks;
    });
  }

  Future<void> _updateTasks() async {
    await SharedPrefHelper.clearTasks();
    for (final task in allTasks) {
      await SharedPrefHelper.addTask(task);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = allTasks
        .where((task) => task.isCompleted == false)
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {}, color: whiteColor),
        title: Text('Todo', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TaskComponent(
                isCompletedOrTodo: true,
                task: task,
                onChanged: (value) async {
                  setState(() {
                    task.isCompleted = value;
                  });
                  await _updateTasks();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
