import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';


appDialog(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.transparent,
        iconPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: context.pagePadding.left, vertical: context.pagePadding.left),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.highlight,
          ),
          child: widget,
        ),
      );
    },
  );
}
