import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/checkout_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/checkout/checkout_bloc.dart';

class CheckoutView extends StatefulWidget {
  final CheckoutBloc bloc;
  const CheckoutView({super.key, required this.bloc});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          context.pagePadding.top,
          context.pagePadding.right,
          context.pagePadding.bottom,
        ),
        children: [
          HeaderWidget(title: "Checkout"),
          SizedBox(height: 20.h),
          AddressSection(),
          SizedBox(height: 20.h),
          PaymentMethodSection(),
          SizedBox(height: 20.h),
          ProductListSection(),
          SizedBox(height: 20.h),
          CalculationSection(),
          SizedBox(height: 20.h),
          AppButton(
            title: 'Place Order',
            onTap: () {
              // Handle place order action
            },
            radius: 30,
          ),
        ],
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Content(
          data: "Delivery Address",
          textStyle: context.headingText.copyWith(color: AppColor.black),
          size: 20,
        ),
        SizedBox(height: 10),
        CheckoutCards(
          title: "123 Main Street, Springfield",
          onTap: () {
            // Handle address selection
          },
        ),
      ],
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Content(
          data: "Payment Method",
          textStyle: context.headingText.copyWith(color: AppColor.black),
          size: 20,
        ),
        SizedBox(height: 10),
        CheckoutCards(
          title: "Credit Card",
          onTap: () {
            // Handle address selection
          },
        ),
      ],
    );
    ;
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CalculationSection extends StatelessWidget {
  const CalculationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
