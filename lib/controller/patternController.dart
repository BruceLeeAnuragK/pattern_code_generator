import 'package:flutter/material.dart';

class PatternController extends ChangeNotifier {
  int align = 0;
  int rows = 0;
  int valueType = 0;
  changeAlignment({required int align}) {
    this.align = align;
    notifyListeners();
  }

  chnageRows({required int rowCounnt}) {
    this.align = align;
    notifyListeners();
  }

  chnagevalueType({required int valueType}) {
    this.valueType = valueType;
    notifyListeners();
  }
}
