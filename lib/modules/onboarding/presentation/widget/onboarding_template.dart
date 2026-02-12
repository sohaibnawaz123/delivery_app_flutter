import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
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
    return Column(
      children: [
        SvgPicture.asset(imagepath,
            height: 200, width: 200, fit: BoxFit.contain),

            Content(data: title,textStyle: context.headingText.copyWith(
              color:AppColor.primary
            ),)
      ],
    );
  }
}
