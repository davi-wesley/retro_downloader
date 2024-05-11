import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color(0xFFDC362E);
  static const Color background = Color(0xFFF9FAFC);

  static const Color primaryComponent = Color(0xFF00AEC7);
  static Color secondaryComponent = const Color(0xFF00AEC7).withOpacity(0.1);

  static const Color greyPrimaryComponent = Color.fromRGBO(69, 73, 80, 0.4);
  static const Color greySecondaryComponent = Color(0xFFF5F5F5);

  static const MaterialColor primary = MaterialColor(
    0xFF00AEC7,
    <int, Color>{
      10: Color.fromRGBO(0, 174, 199, 0.1),
      50: Color.fromRGBO(222, 244, 248, 0.50),
      100: Color(0xFFE3F7FA),
      300: Color(0xFF87E2EE),
      400: Color(0xFF39C7DB),
      500: Color(0xFF00AEC7),
      700: Color(0xFF006877),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFF00C389,
    <int, Color>{
      100: Color(0xFFBDF3E3),
      300: Color(0xFF5EDBB6),
      500: Color(0xFF00C389),
      700: Color(0xFF007552),
    },
  );

  static const MaterialColor blue = MaterialColor(
    0xFF0072CE,
    <int, Color>{
      50: Color.fromRGBO(235, 244, 251, 0.50),
      100: Color(0xFFE0EFFB),
      300: Color(0xFF94C3EA),
      500: Color(0xFF0B8ADE),
      700: Color(0xFF00447C),
    },
  );

  static const MaterialColor grey = MaterialColor(
    0xFF919D9D,
    <int, Color>{
      50: Color.fromRGBO(241, 243, 243, 0.50),
      100: Color(0xFFE5EBF1),
      300: Color(0xFFBEC9D7),
      500: Color(0xFF848a90),
      700: Color(0xFF454950),
    },
  );

  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static MaterialColor error =
      const MaterialColor(0xFFFFFFFF, <int, Color>{500: Color(0xFFDC362E)});
}
