import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskText;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 35.0),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskText = newText;
                },
              ),
              SizedBox(height: 40.0),
              Container(
                height: 60,
                child: TextButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTaskText);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
