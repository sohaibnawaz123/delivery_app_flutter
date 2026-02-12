import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingTemplate extends StatelessWidget {
  const OnboardingTemplate({
    super.key,
    required this.title,
    this.subtitle,
    this.content,
    required this.imagepath,
  });

  final String title;
  final String? subtitle;
  final String? content;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.4;
    return Scaffold(
      backgroundColor: AppColor.transparent,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: context.pagePadding.horizontal,
          vertical: context.pagePadding.horizontal+20,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Content(
                data: title,
                textStyle: context.headingText.copyWith(color: AppColor.primary),
                size: 36,
              ),
              if (subtitle != null) ...[
                Content(
                  data: subtitle ?? '',
                  textStyle: context.subHeadingText.copyWith(
                    color: AppColor.secondaryText,
                  ),
                ),
              ],
              if (content != null) ...[
                Content(
                  data: content ?? '',
                  textStyle: context.bodyText.copyWith(color: AppColor.baseText),alignment: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SvgPicture.asset(
            imagepath,
            width: 300,
            height: height,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(AppColor.primary, BlendMode.dst),
          ),
        ),
      ),
    );
  }
}
