import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/shared/style/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          height: 48,
          width: 4,
          color: primaryColor,
        ),
        title: Text(
          '${task.title}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.alarm,size: 12,),
            Text('${task.description}',
              style: TextStyle(
                  fontSize: 12,
              ),),
          ],
        ),
        trailing: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 16),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.done,color: whiteColor,),
          ),
        ),
      ),
    );
  }
}
