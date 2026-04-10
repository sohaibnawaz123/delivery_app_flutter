import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/checkout/checkout_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/checkout_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/presentation/views/checkout_view.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/cart_product_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/coupon_field.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardcart/dashboardcart_bloc.dart';

class DashboardcartView extends StatelessWidget {
  final DashboardcartBloc bloc;
  const DashboardcartView({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          context.pagePadding.top,
          context.pagePadding.right,
          context.pagePadding.bottom,
        ),
        children: [
          HeaderWidget(title: "Cart"),
          SizedBox(height: 0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CartProductCard();
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 5,
          ),
          SizedBox(height: 10),
          CouponField(),
          SizedBox(height: 20),
          PriceBox(),
          SizedBox(height: 20),
          AppButton(
            title: 'Proceed to Checkout',
            onTap: () => context.pushPage(
              CheckoutView(
                bloc: getIt<CheckoutBloc>(param1: CheckoutViewInitialParams()),
              ),
            ),
            radius: 30,
          ),
        ],
      ),
    );
  }
}

class PriceBox extends StatelessWidget {
  const PriceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.base,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "Total Items",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Content(
                data: "5",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "Subtotal",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Content(
                data: "\$199.99",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "Tax",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Content(
                data: "0.05%",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "Delivery Fee",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Content(
                data: "\$9.99",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(height: 2, color: AppColor.primary.withValues(alpha: 0.5)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: "Total",
                textStyle: context.bodyText.copyWith(
                  color: AppColor.black,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              Content(
                data: "\$209.98",
                textStyle: context.bodyText.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
