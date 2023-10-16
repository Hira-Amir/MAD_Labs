 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFEDEAF4),
  100: Color(0xFFD1CAE5),
  200: Color(0xFFB3A7D3),
  300: Color(0xFF9583C1),
  400: Color(0xFF7E69B4),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF15073A),
  700: Color(0xFF543D96),
  800: Color(0xFF4A358C),
  900: Color(0xFF39257C),
});



 const int _primaryPrimaryValue = 0xFF674EA7;

 const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFCBBDFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF7A57FF),
  700: Color(0xFF663DFF),
});
 const int _primaryAccentValue = 0xFFA28AFF;