import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTasks()[index];

            return TaskTile(
              task,
              (bool? checkBoxState) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.getLength(),
        );
      },
    );
  }
}
