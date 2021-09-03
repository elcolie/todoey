import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  Function(bool?)? callback;

  TaskTile(this.task, this.callback);

  // void checkboxCallback(bool? checkboxState) {
  //   if (checkboxState != null){
  //     setState(() {
  //       isCheck = checkboxState;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        print('${task.name} is deleted');
        Provider.of<TaskData>(context, listen: false).removeTask(task);
      },
      title: Text(task.name,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          )),
      trailing: Checkbox(
        value: task.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: callback,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final dynamic Function(bool?) toggleCheckboxState;

  TaskCheckBox(this.checkboxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
