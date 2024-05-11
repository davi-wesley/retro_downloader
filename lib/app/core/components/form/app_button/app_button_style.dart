import 'package:flutter/material.dart';

enum AppButtonStyle {
  filled(
    Color(0xFF00AEC7),
    Color(0xFFFFFFFF),
    Color(0xFF00AEC7),
    Color(0xFFE5EBF1),
    Color(0xFF9B9FA2),
    Color(0xFFE5EBF1),
  ),
  outlined(
    Color(0xFFFFFFFF),
    Color(0xFF00AEC7),
    Color(0xFFBEC9D7),
    Color(0xFFFFFFFF),
    Color(0xFF848A90),
    Color(0xFFBEC9D7),
  );

  final Color backgroundEnableColor;
  final Color textEnableColor;
  final Color borderEnableColor;
  final Color backgroundDisableColor;
  final Color textDisableColor;
  final Color borderDisableColor;

  const AppButtonStyle(
    this.backgroundEnableColor,
    this.textEnableColor,
    this.borderEnableColor,
    this.backgroundDisableColor,
    this.textDisableColor,
    this.borderDisableColor,
  );
}
