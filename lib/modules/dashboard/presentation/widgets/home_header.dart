import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColor.highlight,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 12),
        Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.highlight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, color: AppColor.black, size: 24),
              Expanded(
                child: Content(
                  data: '123 Main St City, Country',
                  textStyle: context.bodyText.copyWith(
                    color: AppColor.black,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  size: 14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColor.highlight,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_on_outlined, color: AppColor.black),
        ),
      ],
    );
  }
}
