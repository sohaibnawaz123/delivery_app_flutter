import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final String title;
  final IconData imageUrl;
  const IconBox({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppColor.highlight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(imageUrl, size: 36, color: AppColor.primary),
          Expanded(
            child: Content(
              data: title,
              textStyle: context.bodyText.copyWith(
                color: AppColor.primary,
                fontWeight: AppFontWeight.medium,
              ),
              size: 14,
              alignment: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
