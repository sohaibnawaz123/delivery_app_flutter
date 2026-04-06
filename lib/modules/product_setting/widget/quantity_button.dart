
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key, this.size, this.iconSize});
  final double? size;
  final double? iconSize;
  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        GestureDetector(
          onTap: decrement,
          child: CircleAvatar(
            backgroundColor: AppColor.baseText.withValues(alpha: 0.5),
            radius: widget.size ?? 20,
            child: Icon(Icons.remove, size: widget.iconSize ?? 24, color: AppColor.black)),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.center,
          width: 40,
          height: 50,
          child: Content(
            data: count.toString(),
            size: 16.sp,
            textStyle: context.subHeadingText.copyWith(color: AppColor.black),
          ),
        ),
        GestureDetector(
          onTap: increment,
          child: CircleAvatar(
            backgroundColor: AppColor.primary,
          
            radius: widget.size ?? 20,
            child: Icon(Icons.add, size: widget.iconSize ?? 24, color: AppColor.white)),
        ),
      ],
    );
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }
}
