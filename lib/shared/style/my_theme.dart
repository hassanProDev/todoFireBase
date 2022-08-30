import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/colors.dart';

class MyTheming{
  static final ThemeData darkTheme=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),

  );
  static final ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
  );
}