import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/product_setting/widget/quantity_button.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.base,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network('https://cdn-icons-png.flaticon.com/512/1404/1404945.png',fit: BoxFit.cover,),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Content(
                    data: "Product Name",
                    textStyle: context.bodyText.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColor.black
                    ),
                  ),
                  SizedBox(height: 4),
                  Content(
                    data: "Product Description",
                    textStyle: context.bodyText.copyWith(
                      color: AppColor.secondaryText,
                    ),
                    size: 12,
                  ),
                  SizedBox(height: 8),
                  Divider(height: 2, color: AppColor.baseText.withValues(alpha: 0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "\$99.99",
                        textStyle: context.bodyText.copyWith(
                          fontWeight: AppFontWeight.semiBold,
                          color: AppColor.primary,
                        ),
                        size: 18,
                      ),
                      QuantityButton(
                        size: 12,
                        iconSize: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

