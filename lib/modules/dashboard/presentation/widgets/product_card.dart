import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductEntity {
  final String name;
  final String description;
  final double price;
  final bool isFavorite;
  final String imageUrl;
  final String id;
  final String category;
  final double rating;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.isFavorite,
    required this.imageUrl,
    required this.id,
    required this.category,
    required this.rating,
  });
}

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 170,
      // margin: const EdgeInsets.symmetric(horizontal: 8.0, ),
      decoration: BoxDecoration(
        color: AppColor.highlight,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: product.isFavorite ? Colors.red : AppColor.baseText,
              size: 20,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              product.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(height: 8),
          Content(
          data:  product.name,
            textStyle: context.subHeadingText.copyWith(fontWeight:AppFontWeight.semiBold, color: AppColor.primaryText),
            size: 16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Content(
            data: product.description,
            textStyle: context.bodyText.copyWith(color:AppColor.baseText, fontWeight: AppFontWeight.regular),
            size: 12, 
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: '\$${product.price.toStringAsFixed(2)}',
                textStyle: context.bodyText.copyWith(fontWeight: AppFontWeight.bold, color: Colors.green),
                size: 14,
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Content(
                    data: product.rating.toStringAsFixed(1),
                    textStyle: context.bodyText.copyWith(fontSize: 12,fontWeight: AppFontWeight.semiBold, color: AppColor.baseText),
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
