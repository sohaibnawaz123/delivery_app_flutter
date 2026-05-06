
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StatusTile extends StatelessWidget {
  final String error;
  final bool isCenter;
  final bool isButton;
  const StatusTile({
    super.key,
    required this.error,
    this.isCenter = false,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !isButton ? EdgeInsets.zero : context.buttonMargin,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: !isButton
            ? AppColor.transparent
            : AppColor.errorText.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: isCenter
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Content(
              data: error,
              size: 13,
              textStyle: context.bodyText,
              color: !isButton ? AppColor.errorText : AppColor.black,
              alignment: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
