import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return _getLightAppTheme();
}

ThemeData _getDarkAppTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    textTheme: _bodyTextTheme(base.textTheme),
  );
}

ThemeData _getLightAppTheme() {
  final ThemeData base = ThemeData.light();
  return ThemeData(
    textTheme: _buildTextTheme(ThemeData.light().textTheme),
    primaryColor: Colors.white,
    backgroundColor: Color(0xffefeae6),
    accentColor: Color(0xff655542),
    accentColorBrightness: Brightness.dark,
    accentTextTheme: _buildAccentTextTheme(_buildTextTheme(base.textTheme)),
    brightness: Brightness.light,
    buttonTheme: _buildButtonTheme(ThemeData.light().buttonTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        body1: base.body1.copyWith(fontSize: 16.0),
        body2: base.body2.copyWith(fontSize: 18.0),
        display1: base.display1.copyWith(fontSize: 26.0),
        display2: base.display2,
        button: base.button.copyWith(),
      )
      .apply(
        fontFamily: 'Nunito',
      );
}

TextTheme _buildAccentTextTheme(TextTheme base) {
  return base
      .copyWith(
        body1: base.body1.copyWith(color: Colors.white),
        body2: base.body1.copyWith(color: Colors.white),
        display1: base.display1.copyWith(color: Colors.white),
        display2: base.display2.copyWith(color: Colors.white),
        button: base.button.copyWith(color: Colors.white),
      )
      .apply(
        fontFamily: 'Nunito',
      );
}

ButtonThemeData _buildButtonTheme(ButtonThemeData base) {
  return base.copyWith(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))));
}

TextTheme _bodyTextTheme(TextTheme base) {
  return base.apply(fontFamily: 'Nunito');
}

TextTheme primaryTextTheme(TextTheme base) {
  return base.copyWith(
//    body1: base.body1.copyWith(color: Colors.white),
    body2: base.body1.copyWith(
//      color: Colors.white,
      fontSize: 18.0,
    ),
    display1: base.display1.copyWith(fontSize: 24.0),
    display2: base.display2.copyWith(),
  );
}

TextStyle shopListItemHeader(TextTheme base) {
  return base.body2.copyWith(
    fontWeight: FontWeight.bold,
  );
}
