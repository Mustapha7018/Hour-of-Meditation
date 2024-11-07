import 'package:flutter/material.dart';

class AppColor {
  //PRIMARY 
  static const Color primary500 = Color.fromRGBO(20, 28, 41, 1);
  static const Color primary400 = Color.fromRGBO(44, 63, 93, 1);
  static const Color primary300 = Color.fromRGBO(140, 154, 183, 1);
  static const Color primary200 = Color.fromRGBO(240, 242, 248, 1);
  static const Color primary100 = Color.fromRGBO(250, 250, 250, 1);

  //SECONDARY
  static const Color secondary500 = Color.fromRGBO(102, 123, 171, 1);
  static const Color secondary400 = Color.fromRGBO(133, 149, 188, 1);
  static const Color secondary300 = Color.fromRGBO(163, 176, 205, 1);
  static const Color secondary200 = Color.fromRGBO(194, 202, 221, 1);
  static const Color secondary100 = Color.fromRGBO(240, 242, 247, 1);

  //GREYSCALE
  static const Color greyscale900 = Color.fromRGBO(33, 33, 33, 1);
  static const Color greyscale800 = Color.fromRGBO(66, 66, 66, 1);
  static const Color greyscale700 = Color.fromRGBO(97, 97, 97, 1);
  static const Color greyscale600 = Color.fromRGBO(117, 117, 117, 1);
  static const Color greyscale500 = Color.fromRGBO(158, 158, 158, 1);
  static const Color greyscale400 = Color.fromRGBO(189, 189, 189, 1);
  static const Color greyscale300 = Color.fromRGBO(224, 224, 224, 1);
  static const Color greyscale200 = Color.fromRGBO(238, 238, 238, 1);
  static const Color greyscale100 = Color.fromRGBO(245, 245, 245, 1);
  static const Color greyscale50 = Color.fromRGBO(250, 250, 250, 1);

  //SILVER
  static const Color silver = Color.fromRGBO(245, 247, 251, 1);
  static const Color white = Colors.white;

  //TRANSPARENT BLUE
  static const Color transparentBlue = Color.fromRGBO(245, 247, 251, 8);
  static const Color transparent = Colors.transparent;
  
  //GRADIENT
  static const LinearGradient gradientPrimary = LinearGradient(
    colors: [
      Color.fromRGBO(24, 34, 58, 1),
      Color.fromRGBO(70, 78, 97, 1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}