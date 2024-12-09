import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemProvider with ChangeNotifier {
  var _ThemMode = ThemeMode.light;

  ThemeMode get ThemMode => _ThemMode;

 void setThem (ThemMode) {
   _ThemMode = ThemMode;
   notifyListeners();
 }
  Color get containerColor => _ThemMode == ThemeMode.dark ? Colors.lightBlueAccent: Colors.yellow;
}
