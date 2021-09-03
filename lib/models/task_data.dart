import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task('Buy Acura', false),
    Task('Kill Prayut', false),
    Task('Join the protestants', false),
  ];

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  int getLength() {
    return _tasks.length;
  }

  UnmodifiableListView<Task> getTasks() {
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task targetTask){
    _tasks.remove(targetTask);
    notifyListeners();
  }

}
