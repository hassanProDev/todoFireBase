import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  int currentIndex=0;
  ThemeMode themeMode=ThemeMode.light;
  void changeCurrentIndex(int index){
    currentIndex=index;
    notifyListeners();
  }
  void changeTheme(ThemeMode theme){
    themeMode=theme;
    notifyListeners();
  }

}