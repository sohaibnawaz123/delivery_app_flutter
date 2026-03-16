import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthTitleHeader extends StatelessWidget {
  final String heading;
  final String subheading;
  final double? headingSize;
  final double? subheadingSize;
  const AuthTitleHeader({
    super.key,
    required this.heading,
    required this.subheading,
    this.headingSize,
    this.subheadingSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Content(
          data: heading,
          textStyle: context.headingText,
          size: headingSize ?? 28,
          color: AppColor.black,
          weight: AppFontWeight.bold,
        ),
        const SizedBox(height: 8),
        Content(
          data: subheading,
          textStyle: context.bodyText,
          size: subheadingSize ?? 16,
          color: AppColor.baseText,
          weight: AppFontWeight.regular,
        ),
      ],
    );
  }
}
