import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/modules/update_task/update_task.dart';
import 'package:todo_app/shared/component/components.dart';
import 'package:todo_app/shared/style/colors.dart';
import 'package:todo_app/utils/firebase_firestore.dart';

import '../../shared/provider/my_provider.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    MyProvider provid=Provider.of<MyProvider>(context);

    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.4,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (c) {
              showMessage(
                  context,
                  'are you sure to delete item',
                  'Yes',
                  () {
                    deleteTask();
                    Navigator.pop(context);
                  },
                  nonActionName: "cancel",
                  nonActionCallBack: () {
                    Navigator.pop(context);
                  });
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            foregroundColor: Colors.white,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (c) {
              showMessage(
                  context,
                  'are you sure to Update item',
                  'Yes',
                  () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, UpdateTask.routeName,arguments: TaskModel(title: task.title, description: task.description, dateTime: task.dateTime,id: task.id));
                  },
                  nonActionName: "cancel",
                  nonActionCallBack: () {
                    Navigator.pop(context);
                  });
            },
            backgroundColor: primaryColor,
            icon: Icons.delete,
            foregroundColor: Colors.white,
            label: 'Update',
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: provid.themeMode==ThemeMode.light?whiteColor:blackColor, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Container(
            height: 48,
            width: 4,
            color: primaryColor,
          ),
          title: Text(
            '${task.title}',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.alarm,
                size: 12,
              ),
              Text(
                '${task.description}',
                style: TextStyle(
                  fontSize: 12,
                  color: provid.themeMode==ThemeMode.light?blackColor:whiteColor,

                ),
              ),
            ],
          ),
          trailing: InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.done,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    deleteFromFireBase(task).then((value) {}).catchError((e) => print(e));
  }
}
