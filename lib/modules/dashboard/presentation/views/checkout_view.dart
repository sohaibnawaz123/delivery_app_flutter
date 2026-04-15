import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/address_section-widget.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/checkout_product_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/payment_method_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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


class ProductListSection extends StatelessWidget {
  ProductListSection({super.key});

  final List<CheckoutProductCardEntity> products = [
    CheckoutProductCardEntity(
      name: 'Cake',
      description: 'Delicious chocolate cake',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      price: 20.0,
      quantity: 1,
      rate: 4.5,
    ),
    CheckoutProductCardEntity(
      name: 'Pizza',
      description: 'Cheesy pepperoni pizza',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      price: 15.0,
      quantity: 2,
      rate: 4.0,
    ),
    CheckoutProductCardEntity(
      name: 'Burger',
      description: 'Juicy beef burger',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      price: 10.0,
      quantity: 3,
      rate: 4.2,
    ),
    CheckoutProductCardEntity(
      name: "Fries",
      description: 'Crispy golden fries',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      price: 5.0,
      quantity: 1,
      rate: 4.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Content(
          data: "Product List",
          textStyle: context.headingText.copyWith(color: AppColor.black),
          size: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.43,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 5),
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (content, index) {
              return ProductListTile(product: products[index]);
            },
            separatorBuilder: (cxt, index) {
              return SizedBox(height: 8);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}

class CalculationSection extends StatelessWidget {
  const CalculationSection({super.key});
  final List<Map<String, dynamic>> calculations = const [
    {"label": "Subtotal", "value": 50.00, "icon": Icons.shopping_cart,},
    {"label": "Delivery Fee", "value": 5.00, "icon": Icons.delivery_dining,},
    {"label": "Tax", "value": 4.50, "icon": Icons.receipt_long,
    },
    {"label": "Discount", "value": 0.05, "icon": Icons.local_offer,
    },
    {"label": "Total", "value": 59.50, "icon": Icons.attach_money},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Content(
          data: "Price Details",
          textStyle: context.headingText.copyWith(color: AppColor.black),
          size: 20,
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.base,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
        
            children: [
               
              ...calculations.asMap().entries.map((entry) {
                final idx = entry.key;
                final calc = entry.value;
                final isTotal = calc['label'] == "Total";
                final isDiscount = calc['label'] == "Discount";
                final valueWidget = isDiscount
                    ? Row(
                        children: [
                          Icon(Icons.arrow_downward, color: Colors.green, size: isTotal ? 28 : 22),
                          SizedBox(width: 2),
                          Content(
                            data: "-${(calc['value'] * 100).toStringAsFixed(0)}%",
                            textStyle: context.bodyText.copyWith(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                            size: isTotal ? 22 : 16,
                          ),
                        ],
                      )
                    : Content(
                        data: "${calc['value'] is double ? "\$${calc['value'].toStringAsFixed(2)}" : (calc['value'] * 100).toStringAsFixed(0) + '%'}",
                        textStyle: context.bodyText.copyWith(
                          color: isTotal ? AppColor.primary : AppColor.black,
                          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                        ),
                        size: isTotal ? 24 : 18,
                      );
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: isTotal ? 10 : 6, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isTotal
                            ? null
                            : AppColor.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(isTotal ? 12 : 8),
                        border: isTotal
                            ? Border.all(color: AppColor.primary, width: 1.5)
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.07),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(calc['icon'], color: isTotal ? AppColor.primary : AppColor.secondaryText, size: isTotal ? 28 : 22),
                              ),
                              SizedBox(width: 10),
                              Content(
                                data: calc['label'],
                                textStyle: context.bodyText.copyWith(
                                  color: AppColor.black,
                                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                                ),
                                size: isTotal ? 18 : 16,
                              ),
                            ],
                          ),
                          valueWidget,
                        ],
                      ),
                    ),
                    if (idx != calculations.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Divider(
                          color: AppColor.highlight.withOpacity(0.3),
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}




