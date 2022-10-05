import 'package:flutter/material.dart';

/// @Description 全局配置类
class Config {
  /// 主题颜色
  static const int _primaryColorValue = 0xFFff6e61;
  static const Color primaryColor = Color(_primaryColorValue);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFffeef1),
      100: Color(0xFFffd5d9),
      200: Color(0xFFf8a8a5),
      300: Color(0xFFf28882),
      400: Color(_primaryColorValue),
      500: Color(0xFFff6247),
      600: Color(0xFFf75b48),
      700: Color(0xFFe45141),
      800: Color(0xFFd74b3b),
      900: Color(0xFFc8412f),
    },
  );
}
