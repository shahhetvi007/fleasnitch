import 'package:flutter/material.dart';

// const int _colorPrimary1 = 0xffe55f48;
// final MaterialColor primaryColor = MaterialColor(
//   _colorPrimary1,
//   const <int, Color>{
//     50: Color(0xfff2afa4),
//     100: Color(0xffef9f91),
//     200: Color(0xffed8f7f),
//     300: Color(0xffea7f6d),
//     400: Color(0xffe86f5a),
//     500: Color(_colorPrimary1),
//     600: Color(0xffce5641),
//     700: Color(0xffb74c3a),
//     800: Color(0xffa04332),
//     900: Color(0xff89392b),
//   },
// );

const gradientColor1 = Color(0xffe55f48);
const gradientColor2 = Color(0xfff2afa4);
const colorBlack = Color(0xff000000);
const colorWhite = Color(0xffffffff);
const colorTransparent = Colors.transparent;
const primaryColor = Colors.orange;
const secondaryColor = Color(0xffA2E0E1);
const secondaryDarkColor = Color(0xff16AEAF);
final darkGrey = Colors.grey.shade800;
const itemBackground = Color(0xffF3F3F3);
const grey = Colors.grey;

final primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: const [gradientColor1, gradientColor2]);
