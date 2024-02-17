import 'package:flutter/material.dart';

class CountModel extends ChangeNotifier {
  int counter = 0;

  bool toggle = false;
  
  void leftIncrementCounter() {
    counter++;
    notifyListeners();
  }

  void switchToggle() {
    toggle = !toggle;
    notifyListeners();
  }
}