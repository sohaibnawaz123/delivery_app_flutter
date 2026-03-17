import 'package:delivery_app/core/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomBarItem {
  final String label;
  final String icon;
  final String activeIcon;
  final double iconSize;

  const AppBottomBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.iconSize = 22,
  });

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        width: iconSize,
        height: iconSize,
        color: AppColor.headingText,
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        width: iconSize,
        height: iconSize,
        color: AppColor.headingText,
      ),
      label: label,
    );
  }
}
