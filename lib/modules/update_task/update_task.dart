import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/modules/update_task/update_item.dart';
import 'package:todo_app/utils/firebase_firestore.dart';

import '../../shared/provider/my_provider.dart';
import '../../shared/style/colors.dart';

class UpdateTask extends StatelessWidget {
  static const String routeName = 'updateTask';
  // String title;
  // String desc;
  @override
  Widget build(BuildContext context) {
    MyProvider provid = Provider.of<MyProvider>(context);

    TaskModel task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Update'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: primaryColor,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: provid.themeMode == ThemeMode.light
                  ? onPrimaryColor
                  : blackColor,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpdateItem(task),
                  TextField(
                    onChanged: (v){
                      task.title=v;
                    },
                    style: TextStyle(
                      color: provid.themeMode == ThemeMode.light
                          ? blackColor
                          : whiteColor,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Tile',
                      labelStyle: TextStyle(
                        color: provid.themeMode == ThemeMode.light
                            ? blackColor
                            : whiteColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (v){
                      task.description=v;
                    },
                    minLines: 3,
                    maxLines: 3,
                    style: TextStyle(
                      color: provid.themeMode == ThemeMode.light
                          ? blackColor
                          : whiteColor,
                    ),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: provid.themeMode == ThemeMode.light
                            ? blackColor
                            : whiteColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: (){
                      updateFromFireBase(task);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 20, color: whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void update(){
  }
}
