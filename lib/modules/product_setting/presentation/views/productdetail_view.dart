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

class _ProductdetailViewState extends State<ProductdetailView> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=600&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=600&q=80',
  ];

  final List<String> sizes = ['12"', '14"', '16"', '18"'];
  int selectedIndex = -1; // Track selected size index
  @override
  void initState() {
    super.initState();
  }

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
                ProductImageCarosul(imageUrls: imageUrls),
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
                data: "Product Name",
                size: 24.sp,
                textStyle: context.headingText.copyWith(color: AppColor.black),
              ),
              Content(
                data: "\$ 50.00",
                size: 24.sp,
                textStyle: context.headingText,
              ),
            ],
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          Content(
            data: "Product Category",
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
                  title: '4.5 Rating',
                  imageUrl: Icons.star_border,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 20),
          Content(
            data: "Product Category",
            size: 18.sp,
            textStyle: context.subHeadingText.copyWith(
              color: AppColor.black,
              fontWeight: AppFontWeight.semiBold,
            ),
          ).paddingSymmetric(horizontal: context.pagePadding.left),
          SizedBox(height: 10),
          Content(
            data:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
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
              sizes.length,
              (index) => ProductSizeWidget(
                text: sizes[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = selectedIndex == index ? -1 : index;
                  });
                },
              ),
            ),
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
              child: AppButton(title: "Add to Cart", onTap: () {}, radius: 12),
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
