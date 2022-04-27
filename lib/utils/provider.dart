import 'package:flutter/material.dart';
import 'package:flutter_im_app/utils/sp_util.dart';

///跟随系统
const String LOCALE_FOLLOW_SYSTEM = "auto";

class Store {
  Store._internal();
}

///主题
class AppTheme with ChangeNotifier {
  static final List<MaterialColor> materialColors = [
    Colors.blue,
    Colors.lightBlue,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.grey,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.lime
  ];

  MaterialColor _themeColor;

  Brightness _brightness;

  AppTheme(this._themeColor, this._brightness);

  get themeColor => _themeColor;

  get brightness => _brightness;
}
