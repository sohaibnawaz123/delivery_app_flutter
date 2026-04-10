import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/bottom_sheet/app_bottom_sheet.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/component/text_field/content_field.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/checkout_cards.dart';
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

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    void openBottomSheet(Widget child) {
      appBottomSheet(context, child, isMaxHeight: false, maxHeight: 1);
    }

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
          iconPath: AppAsset.location,
          onTap: () {
            // Handle address selection
            openBottomSheet(const AddressBottomSheet());
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
    void openBottomSheet(Widget child) {
      appBottomSheet(
        context,
        child,
        title: "Select Payment Method",
        isMaxHeight: false,
        maxHeight: 1,
      );
    }

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
          iconPath: AppAsset.creditCard,
          onTap: () {
            // Handle payment method selection
            openBottomSheet(const PaymentBottomSheet());
          },
        ),
      ],
    );
   
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

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({super.key});

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  int _selectedIndex = 1; // Default selected: Office
  final List<Map<String, String>> addresses = [
    {
      'label': 'Home',
      'address': '83 Kewanee Road, Southport, PR9 9SX',
      'user': 'James Andrew',
    },
    {
      'label': 'Office',
      'address': '36 Kewanee Road, Southport, PR9 9SX',
      'user': 'James Andrew',
    },
    {
      'label': 'Others',
      'address': '60 Kewanee Road, Southport, PR9 9SX',
      'user': 'James Andrew',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderWidget(title: 'Select Address'),
        SizedBox(height: 30),
        // Search bar
        ContentField(
          hintText: 'Search for location',
          hintStyle: context.bodyText.copyWith(color: AppColor.baseText),
          prefixIcon: Icon(Icons.search, color: AppColor.primary, size: 24),
          isDense: true,
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: AppColor.highlight.withOpacity(0.2),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColor.primary.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColor.primary.withValues(alpha: 0.7),
              width: 1.5,
            ),
          ),
        ),
        SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Content(
            data: 'Saved Address',
            textStyle: context.headingText.copyWith(
              fontSize: 16,
              color: AppColor.black,
            ),
          ),
        ),
        SizedBox(height: 8),
        // Address list
        ...List.generate(addresses.length, (index) {
          final addr = addresses[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.highlight.withOpacity(
                _selectedIndex == index ? 0.25 : 0.12,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _selectedIndex == index
                    ? AppColor.primary
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  index == 0
                      ? Icons.home_outlined
                      : index == 1
                      ? Icons.business_outlined
                      : Icons.location_on_outlined,
                  color: AppColor.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            addr['label']!,
                            style: context.headingText.copyWith(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        addr['address']!,
                        style: context.bodyText.copyWith(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${addr['user']!} · 123456789',
                        style: context.bodyText.copyWith(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                Radio<int>(
                  value: index,
                  groupValue: _selectedIndex,
                  onChanged: (val) {
                    setState(() {
                      _selectedIndex = val!;
                    });
                  },
                  activeColor: AppColor.primary,
                ),
              ],
            ),
          );
        }),
        // Add New Address Button
        SizedBox(height: 4),
        AppButton(
          radius: 30,
          buttonColor: AppColor.highlight.withOpacity(0.15),
          borderWidth: 1,
          borderColor: AppColor.primary.withValues(alpha: 0.5),
          fontColor: AppColor.primary,
          onTap: () {},
          title: 
            'Add New Address',
           
        ),
        SizedBox(height: 16),
        // Apply Button
        AppButton(
          onTap: () {
            Navigator.of(context).pop(_selectedIndex);
          },
        radius: 30,
          title: 'Apply',
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
