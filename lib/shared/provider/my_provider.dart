import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  int currentIndex=0;
  DateTime dateTime=DateTime.now();
  void changeDate(DateTime date){
    dateTime=date;
    notifyListeners();
  }
  void changeCurrentIndex(int index){
    currentIndex=index;
    notifyListeners();
  }

}