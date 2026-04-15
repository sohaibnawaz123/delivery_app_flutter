import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingListTile extends StatelessWidget {
  final SettingListTileEntity entity;
  const SettingListTile({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: entity.child != null ? () {} : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.base,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (entity.iconPath.isNotEmpty)
            SvgPicture.asset(
              entity.iconPath,
              width: 24,
              height: 24,
              // color: AppColor.primary,
            ),
            if (entity.iconPath.isEmpty)
            Icon( 
              Icons.settings,
              size: 24,
              color: AppColor.primary,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Content(
                data: entity.title,
                textStyle: context.bodyText.copyWith(
                  fontWeight: AppFontWeight.medium,
                  color: AppColor.black.withValues(alpha: 0.8),
                ),
                size: 16,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 24, color: AppColor.black),
          ],
        ),
      ),
    );
  }
}
class SettingListTileEntity {
  final String title;
  final String iconPath;
  final Widget? child;

  SettingListTileEntity({
    required this.title,
    required this.iconPath,
    this.child,
  });
}
