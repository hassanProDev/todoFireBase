import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/modules/tasks/task_item.dart';
import 'package:todo_app/shared/style/colors.dart';
import 'package:todo_app/utils/firebase_firestore.dart';

import '../../shared/provider/my_provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime tasksDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    MyProvider provid=Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: provid.themeMode==ThemeMode.light?onPrimaryColor:blackColor,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 12,
                      child: StreamBuilder<QuerySnapshot<TaskModel>>(
                          stream: getDataFromFireStore(tasksDate),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('you have some error');
                            }

                            List<TaskModel> tasks = snapshot.data?.docs
                                    .map((e) => e.data()).toList() ?? [];
                            return ListView.builder(
                              itemCount: tasks.length,
                              itemBuilder: (c, index) => TaskItem(tasks[index]),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: CalendarTimeline(
            initialDate: tasksDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              tasksDate=date;
              setState(() {
              });
            },
            leftMargin: 20,
            monthColor: whiteColor,
            dayColor: blackColor,
            activeDayColor: primaryColor,
            activeBackgroundDayColor: whiteColor,
            dotsColor: primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          ),
        ),
      ],
    );
  }
}
