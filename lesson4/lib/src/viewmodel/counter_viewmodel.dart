import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  int getCounter() {
    return _counter;
  }

  inc() {
    if (_counter > 10) return;
    _counter++;
    notifyListeners();
  }

  dec() {
    if (_counter == 0) return;
    _counter--;
    notifyListeners();
  }
}
