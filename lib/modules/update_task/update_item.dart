import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';

import '../../shared/provider/my_provider.dart';
import '../../shared/style/colors.dart';


class UpdateItem extends StatelessWidget {
TaskModel task;
UpdateItem(this.task);
  @override
  Widget build(BuildContext context) {
    MyProvider provid=Provider.of<MyProvider>(context);

    return Container(
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
      ),
    );
  }
}
