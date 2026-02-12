import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _instance = AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  // ================= Base =================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
  static const Color base = Color(0xFFEAF4EC); // soft green background

  // ================= Brand / UI =================

  static const Color primary = Color(0xFF2F6F3E); // main green
  static const Color grey = Color(0xFFF7F7F7); // card background
  static const Color highlight = Color(0xFFDFF1E3); // light green highlight

  static Color get highlightdark => const Color(0xFF2A3B2E);

  // >>>>>>>>>>>>>>>>>>>>>>> Text <<<<<<<<<<<<<<<<<<<<<<<

  static const Color primaryText = Color(0xFF1A1A1A); // main text
  static const Color secondaryText = Color(0xFF6B6B6B); // subtitle text
  static const Color headingText = Color(0xFF2F6F3E); // headings in green
  static const Color highlightText = Color(0xFF3E8E4E); // accent text
  static const Color baseText = Color(0xFFA0A0A0); // hint/placeholder

  static const Color disabledText = Color(0xFFBDBDBD);
  static const Color errorText = Color(0xFFE53935);

  // ================= Gradient =================

  static const Gradient iconBgGradient = LinearGradient(
    colors: [Color(0xFF2F6F3E), Color(0xFF6FBF73)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
