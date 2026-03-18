import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoryEntity {
  final String name;
  final String imageUrl;

  CategoryEntity({
    required this.name,
    required this.imageUrl,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      decoration: BoxDecoration(
        color: AppColor.highlight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.primary.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.transparent,
            backgroundImage: NetworkImage(category.imageUrl),
          ),
          SizedBox(height: 8),
          Content(
           data: category.name,
           size: 12,
            textStyle: context.bodyText.copyWith(
              color: AppColor.black.withValues(alpha: 0.8),
              fontWeight: AppFontWeight.regular,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}