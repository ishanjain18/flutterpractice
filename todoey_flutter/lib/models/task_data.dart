import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "buy eggs"),
    Task(name: "buy fruit"),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
