import 'package:flutter/material.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';
import '../../core/components/custom_textformfield.dart';
import '../../core/helpers/shared_pref_helper.dart';
import '../../core/models/task_model.dart';

class AddTask extends StatefulWidget {
  static String routeName = 'AddTask';

  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool _isHighPriority = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Name", style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                CustomTextformfield(
                  controller: _titleController,
                  hint: "Finish UI design for login screen",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter task name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Task Description",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                CustomTextformfield(
                  controller: _descController,
                  hint: "Finish onboarding UI and hand off to devs by Thursday.",
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter task description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "High Priority",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: whiteColor,
                      activeTrackColor: mainPrimaryGreenColor,
                      value: _isHighPriority,
                      onChanged: (value) {
                        setState(() {
                          _isHighPriority = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 150),
                ElevatedButton(
                  onPressed: _handleAddTask,
                  child: Text(
                    "+ Add Task",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleAddTask() async {
    if (_formKey.currentState?.validate() ?? false) {
      final newTask = TaskModel(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        isHighPriority: _isHighPriority,
        isCompleted: false,
      );

      await SharedPrefHelper.addTask(newTask);
      Navigator.pop(context);
    }
  }
}
