import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
