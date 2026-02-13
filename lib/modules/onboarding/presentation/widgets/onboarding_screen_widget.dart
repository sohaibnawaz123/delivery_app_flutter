import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({
    super.key,
    required this.imageUrl,
    required this.heading,
    this.subHeadingText,
    this.content,
  });
  final String imageUrl;
  final String heading;
  final String? subHeadingText;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.transparent,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.pagePadding.horizontal,
          vertical: context.pagePadding.horizontal,
        ),
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Content(
                data: heading,
                size: 36,
                color: AppColor.primary,
                alignment: TextAlign.center,
                decoration: TextDecoration.none,
                textStyle: context.headingText.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              const SizedBox(height: 10),
              subHeadingText != null
                  ? Content(
                      data: subHeadingText ?? "",
                      size: 24,
                      color: AppColor.primary,
                      alignment: TextAlign.center,
                      decoration: TextDecoration.none,
                    )
                  : SizedBox.shrink(),
              const SizedBox(height: 10),
              if (content != null) ...[
                Content(
                  data: content ?? "",
                  color: AppColor.secondaryText,
                  alignment: TextAlign.center,
                  decoration: TextDecoration.none,
                  textStyle: context.bodyText,
                ),
              ],
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      body: Align(
        alignment: Alignment(0, -0.6),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: context.pagePadding.top),
          width: double.infinity,
          height: 400,
          child: SvgPicture.asset(imageUrl, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
