import 'package:flutter/material.dart';

import 'config.dart';

const double defaultMargin = 16;

final appThemeData = ThemeData(
  fontFamily: 'Nunito',
  backgroundColor: bgColor,
  primaryColor: pmColor,
  // primarySwatch: Colors.deepPurple,
  dividerColor: Colors.black12,
  accentColor: redColor,
  // cursorColor: redColor,
  // cardColor: lightColor,
  // buttonColor: yellowColor,
  focusColor: redColor,
  hintColor: scColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: bgColor,
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final TextTheme textTheme = TextTheme(
  headline1: _headline1,
);

final TextStyle _headline1 = TextStyle(
  color: lightColor,
  // fontSize: 2.5 * SizeConfig.textMultiplier,
);
