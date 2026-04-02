import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductSizeWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductSizeWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.highlight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Content(
          data: text.toUpperCase(),
          size: 18,
          textStyle: context.headingText.copyWith(
            fontWeight: AppFontWeight.semiBold,
            color: isSelected ? AppColor.white : AppColor.primary,
          ),
        ),
      ),
    );
  }
}
