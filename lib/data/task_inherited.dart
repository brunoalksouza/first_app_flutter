import 'package:first_app_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task('teste', 'assets/images/1.jpg', 4),
    Task('ride', 'assets/images/2.jpg', 5),
    Task('read', 'assets/images/1.jpg', 2),
    Task('meditation', 'assets/images/2.jpg', 4),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'no task inherited found');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
