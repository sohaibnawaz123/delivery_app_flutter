import 'dart:async';
import 'dart:developer';
import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_padding.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/product_setting/widget/icon_box.dart';
import 'package:delivery_app/modules/product_setting/widget/product_size_widget.dart';
import 'package:delivery_app/modules/product_setting/widget/quantity_button.dart';
import 'package:delivery_app/modules/product_setting/widget/review_card.dart';
import 'package:delivery_app/modules/product_setting/demo/product_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/product_setting/presentation/blocs/productdetail/productdetail_bloc.dart';

class ProductdetailView extends StatefulWidget {
  final ProductdetailBloc bloc;
  const ProductdetailView({super.key, required this.bloc});

  @override
  State<ProductdetailView> createState() => _ProductdetailViewState();
}

int selectedIndex = -1; // Track selected size index

class _ProductdetailViewState extends State<ProductdetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: SizedBox.shrink(),
      ),
      body: ListView(
        // padding: EdgeInsets.fromLTRB(
        //   context.pagePadding.left,
        //   context.pagePadding.top + 10,
        //   context.pagePadding.right,
        //   context.pagePadding.bottom,
        // ),
        children: [
          SizedBox(
            child: Stack(
              children: [
                ProductImageCarosul(imageUrls: demoProduct.imageUrls),
                Positioned(
                  top: context.pagePadding.top,
                  left: context.pagePadding.left,
                  right: context.pagePadding.left,
                  child: HeaderWidget(
                    titleColor: AppColor.white,
                    iconColor: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 2, color: AppColor.highlight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Content(
                data: demoProduct.name,
                size: 24.sp,
                textStyle: context.headingText.copyWith(color: AppColor.black),
              ),
              Content(
                data: "\$ ${demoProduct.price.toStringAsFixed(2)}",
                size: 24.sp,
                textStyle: context.headingText,
              ),
            ],
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          Content(
            data: demoProduct.category,
            size: 16.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.light,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),

          SizedBox(height: 20),

          Row(
            spacing: 20,
            children: [
              Expanded(
                child: IconBox(
                  title: 'Free Delivery',
                  imageUrl: Icons.delivery_dining_rounded,
                ),
              ),
              Expanded(
                child: IconBox(
                  title: '30 Minutes',
                  imageUrl: Icons.access_time_sharp,
                ),
              ),
              Expanded(
                child: IconBox(
                  title: '${demoProduct.rating} Rating',
                  imageUrl: Icons.star_border,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 20),
          Content(
            data: demoProduct.category,
            size: 18.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.semiBold,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 10),
          Content(
            data: demoProduct.description,
            size: 14.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.light,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),

          SizedBox(height: 20),
          Content(
            data: "Sized Options",
            size: 18.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.semiBold,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 10),

          Row(
            spacing: 5,
            children: List.generate(
              demoProduct.sizes.length,
              (index) => ProductSizeWidget(
                text: demoProduct.sizes[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = selectedIndex == index ? -1 : index;
                  });
                },
              ),
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 20),
          Content(
            data: "Reviews",
            size: 18.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.semiBold,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: demoProduct.reviews.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final review = demoProduct.reviews[index];
              return ReviewCard(
                userName: review.userName,
                rating: review.rating,
                comment: review.comment,
              );
            },
          ).paddingSymmetric(horizontal: context.pagePadding.left),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          10,
          context.pagePadding.left,
          MediaQuery.of(context).viewInsets.bottom < 10
              ? context.pagePadding.bottom
              : context.pagePadding.bottom,
        ),
        child: Row(
          children: [
            Expanded(child: QuantityButton()),
            Expanded(
              child: AppButton(title: "Add to Cart", onTap: () {}, radius: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImageCarosul extends StatefulWidget {
  final List<String>? imageUrls;
  const ProductImageCarosul({super.key, this.imageUrls});

  @override
  State<ProductImageCarosul> createState() => _ProductImageCarosulState();
}

class _ProductImageCarosulState extends State<ProductImageCarosul> {
  int _currentIndex = 0;
  late final PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    if ((widget.imageUrls ?? []).length <= 1) return;
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;
      final images = widget.imageUrls ?? [];
      int nextPage = (_currentIndex + 1) % images.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imageUrls ?? [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          child: images.isNotEmpty
              ? PageView.builder(
                  itemCount: images.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                )
              : Container(
                  color: AppColor.highlight,
                  child: Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                ),
        ),
        const SizedBox(height: 10),
        if (images.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.pagePadding.left),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _currentIndex;
                  log('Image URL: ${images[index]}, isSelected: $isSelected');
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border.all(color: AppColor.primary, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          images[index],
                          width: 48,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
