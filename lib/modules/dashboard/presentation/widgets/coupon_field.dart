import 'package:delivery_app/component/text_field/content_field.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class CouponField extends StatelessWidget {
  const CouponField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 12, 5),
      decoration: BoxDecoration(
        color: AppColor.base,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: ContentField(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              prefixIcon: Icon(Icons.search, color: AppColor.primary,size: 24,),
              hintText: "Enter coupon code",
              hintStyle: context.bodyText.copyWith(color: AppColor.secondaryText,fontSize: 14),
              border: InputBorder.none,
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColor.primary,
            radius: 20,
            child: Icon(Icons.arrow_forward, size: 24, color: AppColor.white)),
        ],
      ),
    );
  }
}
