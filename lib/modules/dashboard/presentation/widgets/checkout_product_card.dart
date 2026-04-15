import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final CheckoutProductCardEntity product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.highlight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: product.name,
                      textStyle: context.headingText.copyWith(
                        fontSize: 15,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Content(
                      data: product.rate.toString(),
                      textStyle: context.headingText.copyWith(
                        fontSize: 15,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Content(
                  data: product.description,
                  textStyle: context.bodyText.copyWith(
                    color: AppColor.secondaryText,
                  ),
                  size: 12,
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: product.quantity.toString(),
                        style: context.bodyText.copyWith(
                          fontSize: 14,
                          color: AppColor.secondaryText,
                          fontWeight: FontWeight.bold,
                        ),

                        children: [
                          TextSpan(
                            text: ' x ',
                            style: context.bodyText.copyWith(
                              fontSize: 12,
                              color: AppColor.secondaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "\$${product.price.toStringAsFixed(2)}",
                            style: context.bodyText.copyWith(
                              fontSize: 14,
                              color: AppColor.secondaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Content(
                      data:
                          '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                      textStyle: context.headingText.copyWith(
                        color: AppColor.primary,
                      ),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutProductCardEntity {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;
  final double rate;

  CheckoutProductCardEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.rate,
  });
}
