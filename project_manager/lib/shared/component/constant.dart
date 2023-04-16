import 'package:flutter/material.dart';

const Color mainColor = Color(0xff01b397);

const MaterialColor maincolor1 =
    MaterialColor(_maincolor1PrimaryValue, <int, Color>{
  50: Color(0xFFE1F6F3),
  100: Color(0xFFB3E8E0),
  200: Color(0xFF80D9CB),
  300: Color(0xFF4DCAB6),
  400: Color(0xFF27BEA7),
  500: Color(_maincolor1PrimaryValue),
  600: Color(0xFF01AC8F),
  700: Color(0xFF01A384),
  800: Color(0xFF019A7A),
  900: Color(0xFF008B69),
});
const int _maincolor1PrimaryValue = 0xFF01B397;

const MaterialColor maincolor1Accent =
    MaterialColor(_maincolor1AccentValue, <int, Color>{
  100: Color(0xFFB7FFEA),
  200: Color(_maincolor1AccentValue),
  400: Color(0xFF51FFCD),
  700: Color(0xFF37FFC5),
});
const int _maincolor1AccentValue = 0xFF84FFDB;
