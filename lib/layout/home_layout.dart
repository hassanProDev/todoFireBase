import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/tabs.dart';
import 'package:todo_app/modules/add_tasks_bottom_sheet.dart';
import 'package:todo_app/shared/provider/my_provider.dart';
import 'package:todo_app/shared/style/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'homeLayout';

  @override
  Widget build(BuildContext context) {
    MyProvider provid = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: primaryColor,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'TO DO List',
              style: TextStyle(color: whiteColor),
            ),
          ),
          // -------------------------------------------

          body: tabs[provid.currentIndex],
// -------------------------------------------
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: StadiumBorder(
              side: BorderSide(
                width: 4,
                color: whiteColor,
              ),
            ),
            onPressed: () {
              addTasksBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
          // -------------------------------------------

          bottomNavigationBar: Container(
            color: provid.themeMode==ThemeMode.light?onPrimaryColor:blackColor,
            child: BottomAppBar(

                shape: CircularNotchedRectangle(),
                notchMargin: 8,
                child: BottomNavigationBar(
                  onTap: (value) {
                    provid.changeCurrentIndex(value);
                  },
                  currentIndex: provid.currentIndex,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: primaryColor,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: 'Menu'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: 'settings'),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  void addTasksBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return AddTasksBottomSheet();
      },
      isScrollControlled: true,
    );
  }
}
