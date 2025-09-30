import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void increment(int value) {
    _counterValue += value;
    notifyListeners();
  }

  void decrement(int value) {
    _counterValue -= value;
    notifyListeners();
  }
}
