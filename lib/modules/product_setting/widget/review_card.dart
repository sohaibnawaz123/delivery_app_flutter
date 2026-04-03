import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReviewCard extends StatelessWidget {
  final String userName;
  final double rating;
  final String comment;

  const ReviewCard({
    super.key,
    required this.userName,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.pagePadding.left),
      decoration: BoxDecoration(
        color: AppColor.base.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.max  ,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColor.highlight,
            child: Icon(Icons.person, color: AppColor.primary, size: 36),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Content(
                        data: userName,
                        textStyle: context.bodyText.copyWith(
                          fontWeight: AppFontWeight.semiBold,
                          color: AppColor.black,
                        ),
                        size: 16.sp,
                      ),
                    ),
                    StarRateWidget(rating: rating,size: 20.sp,),
                  ],
                ),
                SizedBox(height: 5),
                Content(
                  data: comment,
                  textStyle: context.bodyText.copyWith(
                    fontWeight: AppFontWeight.regular,
                    color: AppColor.black,
                  ),
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRateWidget extends StatelessWidget {
  final double rating; // Accepts ratings like 3.5, 4.0, etc.
  final int starCount;
  final double size;

  const StarRateWidget({
    super.key,
    this.rating = 0.0,
    this.starCount = 5,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    for (int i = 0; i < starCount; i++) {
      if (i < fullStars) {
        stars.add(Icon(Icons.star, color: Colors.amber, size: size));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(Icon(Icons.star_half, color: Colors.amber, size: size));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.amber, size: size));
      }
    }
    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
