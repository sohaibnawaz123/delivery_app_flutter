import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutCards extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CheckoutCards({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.base,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 24,
              height: 24,
              color: AppColor.black.withValues(alpha: 0.8),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Content(
                data: title,
                textStyle: context.bodyText.copyWith(
                  fontWeight: AppFontWeight.medium,
                  color: AppColor.black.withValues(alpha: 0.8),
                ),
                size: 16,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: AppColor.black,
            ),

          ],
        ),
      ),
    );
  }
}
