import 'package:flutter/material.dart';
import '../../../core/models/task_model.dart';
import '../../../core/styles/colors.dart';

class TaskComponent extends StatelessWidget {
  final TaskModel task;
  final void Function(bool? value) onChanged;
  final bool? isCompletedOrTodo ;
  const TaskComponent({
    super.key,
    required this.task,
    required this.onChanged,
      this.isCompletedOrTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Checkbox(
            value: task.isCompleted ?? false,
            onChanged: onChanged,
            activeColor: mainPrimaryGreenColor,
            checkColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child:     Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    decoration: task.isCompleted == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.isCompleted == true
                        ? taskColor
                        : null,
                    decorationThickness: 0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                task.description?.isNotEmpty == true
                    ? Text(
                  task.description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    decoration: task.isCompleted == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: grayDarkColor,
                    decorationThickness: 0.5,
                  ),
                  maxLines:2,
                  overflow: TextOverflow.ellipsis,
                )
                    : const SizedBox.shrink(),
              ],
            ),
          ),

          isCompletedOrTodo?? false ?
          const Icon(Icons.more_vert, color: grayDarkColor)
              : const SizedBox.shrink(),

        ],
      ),
    );
  }
}
