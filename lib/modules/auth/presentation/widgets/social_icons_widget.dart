import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.baseText.withValues(alpha: 0.5),
            thickness: 2,
            radius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Content(
            data: 'OR',
            textStyle: context.bodyText,
            color: AppColor.baseText,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColor.baseText.withValues(alpha: 0.5),
            thickness: 2,
            radius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ],
    );
  }
}

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAsset.google, width: 40, height: 40),
        SizedBox(width: 20),
        Image.asset(AppAsset.facebook, width: 40, height: 40),
        SizedBox(width: 20),
        Image.asset(AppAsset.apple, width: 40, height: 40),
      ],
    );
  }
}
