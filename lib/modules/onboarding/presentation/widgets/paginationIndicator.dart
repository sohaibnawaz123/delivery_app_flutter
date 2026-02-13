import 'package:delivery_app/core/resource/app_color.dart';
import 'package:flutter/material.dart';

Widget paginationIndicator(int length, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(length, (i) {
      final isActive = i == index;
      return Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: isActive? 20:10,
            height: isActive ? 20 : 10,
            decoration: BoxDecoration(
              gradient: AppColor.iconBgGradient.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          if (isActive) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                gradient: AppColor.iconBgGradient.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ],
      );
    }),
  );
}
