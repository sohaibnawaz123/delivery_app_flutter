import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckBoxWidget extends StatefulWidget {
  final String text;
  final ValueChanged<bool?>? onChanged;
  const CheckBoxWidget({super.key, required this.text, this.onChanged});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged?.call(_isChecked);
      },

      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _isChecked
              ? SvgPicture.asset(
                  AppAsset.circleOutline,
                  width: 24,
                  height: 24,
                  color: AppColor.primary,
                )
              : Icon(Icons.circle_outlined, color: AppColor.primary, size: 24),
          SizedBox(width: 8),
          Content(
            data: widget.text,
            textStyle: context.bodyText,
            color: AppColor.black,
          ),
        ],
      ),
    );
  }
}
