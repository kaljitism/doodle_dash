import 'package:flutter/material.dart';

class LineProvider extends ChangeNotifier {
  Offset? _p1;
  Offset? get p1 => _p1;

  Offset? _p2;
  Offset? get p2 => _p2;

  void setP1(Offset? point) {
    _p1 = point;
    notifyListeners();
  }

  void setP2(Offset? point) {
    _p2 = point;
    notifyListeners();
  }
}
