import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/product_setting/demo/product_demo.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/myorders/myorders_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyordersView extends StatefulWidget {
  final MyordersBloc bloc;
  const MyordersView({super.key, required this.bloc});

  @override
  State<MyordersView> createState() => _MyordersViewState();
}

class _MyordersViewState extends State<MyordersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.white,

      body: Padding(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          context.pagePadding.top,
          context.pagePadding.right,
          context.pagePadding.bottom,
        ),
        child: Column(
          children: [
            HeaderWidget(title: 'My Orders'),
            const SizedBox(height: 30),
            const Expanded(child: TabSection()),
          ],
        ),
      ),
    );
  }
}

class TabSection extends StatefulWidget {
  const TabSection({super.key});

  @override
  State<TabSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection> {
  static const List<String> _tabs = ['Ongoing', 'Completed', 'Canceled'];
  // late TabController _tabController;
  int _selectedIndex = 0;
  final List<OrderEintity> orders = [
    OrderEintity(
      orderId: "123456",
      restaurantName: "Pizza Place",
      orderStatus: "Ongoing",
      orderDate: "2024-06-15",
      totalAmount: 50.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "654321",
      restaurantName: "Burger Joint",
      orderStatus: "Completed",
      orderDate: "2024-06-10",
      totalAmount: 30.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "654321",
      restaurantName: "Burger Joint",
      orderStatus: "Ongoing",
      orderDate: "2024-06-10",
      totalAmount: 30.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "654321",
      restaurantName: "Burger Joint",
      orderStatus: "Ongoing",
      orderDate: "2024-06-10",
      totalAmount: 30.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "789012",
      restaurantName: "Sushi Bar",
      orderStatus: "Canceled",
      orderDate: "2024-06-12",
      totalAmount: 40.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "789011",
      restaurantName: "Sushi Bar",
      orderStatus: "Completed",
      orderDate: "2024-06-12",
      totalAmount: 40.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "789011",
      restaurantName: "Sushi Bar",
      orderStatus: "Canceled",
      orderDate: "2024-06-12",
      totalAmount: 40.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "789011",
      restaurantName: "Sushi Bar",
      orderStatus: "Completed",
      orderDate: "2024-06-12",
      totalAmount: 40.0,
      product: demoProduct,
    ),
    OrderEintity(
      orderId: "789011",
      restaurantName: "Sushi Bar",
      orderStatus: "Canceled",
      orderDate: "2024-06-12",
      totalAmount: 40.0,
      product: demoProduct,
    ),

  ];
  final List<OrderEintity> filteredOrders = [];
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 3, vsync: this);
    filteredOrders.addAll(orders.where((order) => order.orderStatus.toLowerCase() ==
        _tabs[0].toLowerCase()));
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTab(
          tabs: _tabs,
          selectedIndex: _selectedIndex,
          onTabSelected: (index) {
            setState(() {
              filteredOrders.clear();
              _selectedIndex = index;
              filteredOrders.addAll(orders.where((order) => order.orderStatus.toLowerCase() ==
                  _tabs[_selectedIndex].toLowerCase()));
            });
          },
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: ListView.separated(
            itemCount: filteredOrders.length,
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) => OrderCards(order: filteredOrders[index]),
          ),
        ),
      ],
    );
  }
}

class CustomTab extends StatefulWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabSelected;
  const CustomTab({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.onTabSelected,
  });

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.tabs.isEmpty) {
      return const SizedBox.shrink();
    }

    final int safeSelectedIndex = widget.selectedIndex
        .clamp(0, widget.tabs.length - 1)
        .toInt();

    return Row(
      spacing: 5,
      children: List.generate(widget.tabs.length, (index) {
        final bool isSelected = index == safeSelectedIndex;
        return Expanded(
          child: GestureDetector(
            onTap: widget.onTabSelected == null
                ? null
                : () => widget.onTabSelected!(index),
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primary : AppColor.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Content(
                      textStyle: context.bodyText.copyWith(
                        color: isSelected
                            ? AppColor.white
                            : AppColor.secondaryText.withOpacity(0.7),
                        fontWeight: isSelected
                            ? AppFontWeight.semiBold
                            : AppFontWeight.medium,
                      ),
                      data: widget.tabs[index],
                      size: 16,
                    ),
                    SizedBox(height: 5.h),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      height: 2.4.h,
                      width: isSelected ? 100.w : 70.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.white
                            : AppColor.secondaryText.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class OrderCards extends StatelessWidget {
  final OrderEintity order;
  const OrderCards({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColor.highlight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(order.product.imageUrls.first),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Content(
                            textStyle: context.bodyText.copyWith(
                              color: AppColor.black,
                              fontWeight: AppFontWeight.semiBold,
                              fontSize: 14.h,
                            ),
                            data: order.product.name,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Content(
                            textStyle: context.bodyText.copyWith(
                              color: AppColor.black.withOpacity(0.7),
                              fontWeight: AppFontWeight.medium,
                              fontSize: 12.h,
                            ),
                            data: order.orderStatus,
                          ),
                        ),
                      ],
                    ),
                    Content(
                      textStyle: context.bodyText.copyWith(
                        color: AppColor.black.withOpacity(0.7),
                        fontWeight: AppFontWeight.regular,
                        fontSize: 12.h,
                      ),
                      data: order.product.description,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Content(
                          textStyle: context.bodyText.copyWith(
                            color: AppColor.black,
                            fontWeight: AppFontWeight.bold,
                            fontSize: 14.h,
                          ),
                          data: "${order.product.price.toStringAsFixed(2)} EGP",
                        ),
                        Content(
                          textStyle: context.bodyText.copyWith(
                            color: AppColor.black,
                            fontWeight: AppFontWeight.bold,
                            fontSize: 14.h,
                          ),
                          data: "${order.product.rating.toString()} ⭐",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 20.h,
            thickness: 1,
            color: AppColor.black.withOpacity(0.1),
          ),
          Row(
            children: [
              Content(
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black.withOpacity(0.7),
                  fontWeight: AppFontWeight.medium,
                  fontSize: 12.h,
                ),
                data: order.orderDate,
              ),
              if (order.orderStatus.toLowerCase() == "ongoing") ...[
                Expanded(
                  child: Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        isResponsiveWidth: true,
                        isResponsiveHeight: true,
                        buttonColor: AppColor.errorText.withValues(alpha: 0.2),
                        fontColor: AppColor.errorText,
                        title: "Cancel",
                        radius: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                      ),
                      AppButton(
                        isResponsiveWidth: true,
                        isResponsiveHeight: true,
                        title: "Track Order",
                        radius: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (order.orderStatus.toLowerCase() == "completed") ...[
                Expanded(
                  child: Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        isResponsiveWidth: true,
                        isResponsiveHeight: true,
                        buttonColor: AppColor.highlight,
                        fontColor: AppColor.primary,
                        title: "Rating",
                        radius: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                      ),
                      AppButton(
                        isResponsiveWidth: true,
                        isResponsiveHeight: true,
                        title: "Re Order",
                        radius: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (order.orderStatus.toLowerCase() == "canceled") ...[
                Expanded(
                  child: Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        isResponsiveWidth: true,
                        isResponsiveHeight: true,
                        title: "Re Order",
                        radius: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class OrderEintity {
  final String orderId;
  final String restaurantName;
  final String orderStatus;
  final String orderDate;
  final double totalAmount;
  final ProductDemo product;

  OrderEintity({
    required this.orderId,
    required this.restaurantName,
    required this.orderStatus,
    required this.orderDate,
    required this.totalAmount,
    required this.product,
  });
}
