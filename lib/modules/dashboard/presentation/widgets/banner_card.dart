import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class BannerEntity {
  final String imageUrl;
  final String title;
  final String description;

  BannerEntity({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class BannerCard extends StatelessWidget {
  final BannerEntity banner;

  const BannerCard({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColor.highlight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.primary.withValues(alpha: 0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColor.primary.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                 data: banner.title,
                  textStyle: context.headingText.copyWith(
                    color: AppColor.primary,
                    fontWeight: AppFontWeight.bold,
                  ),
                  size: 28,

                ),
                SizedBox(height: 5),
                Content(
                  data: banner.description,
                  textStyle: context.bodyText.copyWith(
                    color: AppColor.baseText,
                  ),
                  size: 14,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              banner.imageUrl,
              width: 120,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}