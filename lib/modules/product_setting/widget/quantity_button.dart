import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        AppButton(
          width: 50,
          height: 50,
          title: "-",
          onTap: decrement,
          buttonColor: AppColor.baseText.withValues(alpha: 0.5),
          radius: 16,
          fontSize: 24,
          fontColor: AppColor.black,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.center,
          width: 30,
          height: 50,
          child: Content(
            data: count.toString(),
            size: 18,
            textStyle: context.subHeadingText.copyWith(color: AppColor.black),
          ),
        ),
        AppButton(
          width: 50,
          height: 50,
          title: "+",
          onTap: increment,
          radius: 16,
          fontSize: 24,
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
