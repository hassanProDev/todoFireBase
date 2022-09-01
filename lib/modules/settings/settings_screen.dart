import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/provider/my_provider.dart';
import 'package:todo_app/shared/style/colors.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provid=Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: primaryColor,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: provid.themeMode==ThemeMode.light?onPrimaryColor:blackColor,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      provid.changeTheme(ThemeMode.light);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Light'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      provid.changeTheme(ThemeMode.dark);

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Dark'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
