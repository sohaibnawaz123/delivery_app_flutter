import 'package:delivery_app/component/text_field/content_field.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ContentField(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search,size: 24,color:AppColor.primary,),
            fillColor: AppColor.highlight.withOpacity(0.3),
            hintStyle: context.bodyText.copyWith(
              color: AppColor.primary,
              fontSize: 14,
            ),

          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.highlight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            AppAsset.filter,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}