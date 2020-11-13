import 'package:flutter/material.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

const double defaultMargin = 16;

// const Color appBackgroundColor = Color(0xFFFFF7EC);
const Color appBackgroundColor = Color(0xFFFFFFFF);
// const Color topBarBackgroundColor = Color(0xFFFFD974);
const Color topBarBackgroundColor = Color(0xFF00D885);
// const Color selectedTabBackgroundColor = Color(0xFFFFC442);
const Color selectedTabBackgroundColor = Color(0xFF019E57);
const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
const Color subTitleTextColor = Color(0xFF9F988F);

const Color lightPrimary = Color(0xFFFFFFFF);
const Color darkPrimary = Colors.black;

const Color lightAccent = Color(0xFF00D885);
const Color darkAccent = Color(0xFF019E57);

const Color lightBackground = Color(0xFFFFF7EC);
const Color darkBackground = Colors.black;

const Color ratingBG = Color(0xFFFFC442);

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    backgroundColor: lightBackground,
    primaryColor: lightPrimary,
    primaryColorDark: Color(0xFF9F988F),
    dividerColor: Colors.black12,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    textTheme: lightTextTheme,
  ),
  AppTheme.DarkTheme: ThemeData(
    backgroundColor: darkBackground,
    primaryColor: darkPrimary,
    primaryColorDark: lightBackground,
    dividerColor: Colors.white12,
    accentColor: darkAccent,
    cursorColor: darkAccent,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkPrimary,
    textTheme: darkTextTheme,
  ),
};

final TextTheme lightTextTheme = TextTheme(
  headline6: _titleLight,
  subtitle2: _subTitleLight,
  button: _buttonLight,
  headline4: _greetingLight,
  headline3: _searchLight,
  bodyText1: _selectedTabLight,
  bodyText2: _unSelectedTabLight,
);

final TextTheme darkTextTheme = TextTheme(
  headline6: _titleDark,
  subtitle2: _subTitleDark,
  button: _buttonDark,
  headline4: _greetingDark,
  headline3: _searchDark,
  bodyText1: _selectedTabDark,
  bodyText2: _unSelectedTabDark,
);

final TextStyle _titleLight = TextStyle(
  color: Colors.black,
  // fontSize: 3.5 * SizeConfig.textMultiplier,
  // fontSize: 2.5 * SizeConfig.textMultiplier,
);

final TextStyle _subTitleLight = TextStyle(
  color: subTitleTextColor,
  // fontSize: 2 * SizeConfig.textMultiplier,
  height: 1.5,
);

final TextStyle _buttonLight = TextStyle(
  color: Colors.black,
  // fontSize: 2.5 * SizeConfig.textMultiplier,
);

final TextStyle _greetingLight = TextStyle(
  color: Colors.black,
  // fontSize: 2.0 * SizeConfig.textMultiplier,
);

final TextStyle _searchLight = TextStyle(
  color: Colors.black,
  // fontSize: 2.3 * SizeConfig.textMultiplier,
);

final TextStyle _selectedTabLight = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  // fontSize: 2 * SizeConfig.textMultiplier,
);

final TextStyle _unSelectedTabLight = TextStyle(
  color: Colors.grey,
  // fontSize: 2 * SizeConfig.textMultiplier,
);

final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);

final TextStyle _subTitleDark = _subTitleLight.copyWith(color: Colors.white70);

final TextStyle _buttonDark = _buttonLight.copyWith(color: Colors.black);

final TextStyle _greetingDark = _greetingLight.copyWith(color: Colors.black);

final TextStyle _searchDark = _searchLight.copyWith(color: Colors.black);

final TextStyle _selectedTabDark =
    _selectedTabLight.copyWith(color: Colors.white);

final TextStyle _unSelectedTabDark =
    _selectedTabLight.copyWith(color: Colors.white70);
