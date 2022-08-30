import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/shared/component/components.dart';
import 'package:todo_app/shared/style/colors.dart';

import '../utils/firebase_firestore.dart';

class AddTasksBottomSheet extends StatefulWidget {
  @override
  State<AddTasksBottomSheet> createState() => _AddTasksBottomSheetState();
}

class _AddTasksBottomSheetState extends State<AddTasksBottomSheet> {
  var selectedDate = DateTime.now();
  late String title;
  late String desc;
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Add New Task',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      onChanged: (v) {
                        title = v;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your task title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Enter your task'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      onChanged: (v) {
                        desc = v;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your task description';
                        }
                        return null;
                      },
                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(hintText: 'Description'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Select Time',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        openDatePicker(context);
                      },
                      child: Text(
                        '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          TaskModel task = TaskModel(
                              title: title,
                              description: desc,
                              isDone: true,
                              dateTime: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                          addTaskToFireStore(task).then((value) {
                            showLoading(context, 'Loading');
                            hideBottomSheet(context);
                            showMessage(context, 'added succesfully', 'OK', () {
                              hideBottomSheet(context);
                              hideBottomSheet(context);

                            });

                          }).catchError((error) {
                            print(error);
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Add tasks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openDatePicker(BuildContext context) async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chooseDate != null) {
      selectedDate=chooseDate;
    }
  }
}
