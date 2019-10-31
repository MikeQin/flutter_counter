import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int count;

  Counter(this.count);

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      count--;
      notifyListeners();
    } else {
      print('WARN: Counter is zero, cannot be decreased');
    }
  }
}
