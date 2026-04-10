import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/bottom_sheet/app_bottom_sheet.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/component/text_field/content_field.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/checkout_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
                      ? Icons.home_rounded
                      : index == 1
                      ? Icons.business_rounded
                      : Icons.location_on_rounded,
                  color: AppColor.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Content(
                            data: addr['label']!,
                            textStyle: context.headingText.copyWith(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Content(
                        data: addr['address']!,
                        textStyle: context.bodyText.copyWith(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 2),
                      Content(
                        data: '${addr['user']!} · 123456789',
                        textStyle: context.bodyText.copyWith(
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
          title: 'Add New Address',
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
  int _selectedIndex = 1; // Default selected: Office
  final List<Map<String, String>> methods = [
    {
      'label': 'Cash on Delivery',
      'address': 'Pay with cash upon delivery',
      'cardNo': "",
    },
    {
      'label': 'Visa Card',
      'address': 'Pay with Visa Card',
      'cardNo': "xxxx xxxx xxxx 9012",
    },
    {
      'label': 'PayPal',
      'address': 'Pay with PayPal',
      'cardNo': "xxxx xxxx xxxx 3456",
    },
  ];
  @override
  Widget build(BuildContext context) {
    void openAddCardSheet() {
      appBottomSheet(
        context,
        const AddNewPaymentCard(),
        isMaxHeight: true,
        maxHeight: 1,
      );
    }

    return Column(
      children: [
        HeaderWidget(title: 'Select Payment Method'),
        SizedBox(height: 30),
        ...List.generate(methods.length, (index) {
          final method = methods[index];
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
                SvgPicture.asset(
                  index == 0
                      ? AppAsset.cash
                      : index == 1
                      ? AppAsset.creditCard
                      : AppAsset.paypal,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Content(
                            data: method['label']!,
                            textStyle: context.headingText.copyWith(
                              fontSize: 15,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Content(
                        data: method['address']!,
                        textStyle: context.bodyText.copyWith(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                      Content(
                        data: method['cardNo'] ?? "",
                        textStyle: context.bodyText.copyWith(
                          fontSize: 13,
                          color: Colors.grey[700],
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
        SizedBox(height: 20),
        AppButton(
          radius: 30,
          buttonColor: AppColor.highlight.withOpacity(0.15),
          borderWidth: 1,
          borderColor: AppColor.primary.withValues(alpha: 0.5),
          fontColor: AppColor.primary,
          onTap: openAddCardSheet,
          title: 'Add New Card',
        ),
        SizedBox(height: 16),
        // Apply Button
        AppButton(
          onTap: () {
            context.popPage();
          },
          radius: 30,
          title: 'Apply',
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class AddNewPaymentCard extends StatefulWidget {
  const AddNewPaymentCard({super.key});

  @override
  State<AddNewPaymentCard> createState() => _AddNewPaymentCardState();
}

class _AddNewPaymentCardState extends State<AddNewPaymentCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  // Format card number with spaces after every 4 digits
  void _onCardNumberChanged(String value) {
    String digits = value.replaceAll(RegExp(r'\D'), '');
    String formatted = '';
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) formatted += ' ';
      formatted += digits[i];
    }
    if (formatted != value) {
      cardNumberController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    setState(() {});
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(title: 'Add New Card'),
          SizedBox(height: 30),
          buildCard(
            cardHolderName: cardHolderController.text.isEmpty
                ? null
                : cardHolderController.text,
            cardNumber: cardNumberController.text.isEmpty
                ? null
                : cardNumberController.text,
            expiryDate: expiryController.text.isEmpty
                ? null
                : expiryController.text,
          ),
          SizedBox(height: 30),
          ContentField(
            keyboardType: TextInputType.number,
            hintText: 'Card Number',
            controller: cardNumberController,
            onChanged: _onCardNumberChanged,
            hintStyle: context.bodyText.copyWith(color: AppColor.baseText),
            prefixIcon: Icon(
              Icons.credit_card,
              color: AppColor.primary,
              size: 24,
            ),
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
          ContentField(
            keyboardType: TextInputType.text,
            hintText: 'Card Holder Name',
            controller: cardHolderController,
            onChanged: (_) => setState(() {}),
            hintStyle: context.bodyText.copyWith(color: AppColor.baseText),
            prefixIcon: Icon(Icons.person, color: AppColor.primary, size: 24),
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
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(now.year, now.month),
                      lastDate: DateTime(now.year + 20, 12),
                      helpText: 'Select Expiry Date',
                      fieldLabelText: 'Expiry Date',
                      fieldHintText: 'MM/YY',
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: AppColor.primary,
                              onPrimary: Colors.white,
                              onSurface: AppColor.baseText,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      expiryController.text =
                          '${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}';
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: ContentField(
                      keyboardType: TextInputType.number,
                      hintText: 'MM/YY',
                      controller: expiryController,
                      onChanged: (_) {},
                      hintStyle: context.bodyText.copyWith(
                        color: AppColor.baseText,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: AppColor.primary,
                        size: 24,
                      ),
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
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ContentField(
                  hintText: 'CVV',
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  onChanged: (_) => setState(() {}),
                  hintStyle: context.bodyText.copyWith(
                    color: AppColor.baseText,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColor.primary,
                    size: 24,
                  ),
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
              ),
            ],
          ),
          SizedBox(height: 24),
          AppButton(title: 'Save Card', onTap: () {}, radius: 30),
        ],
      ),
    );
  }

  Widget buildCard({
    String? cardHolderName,
    String? cardNumber,
    String? expiryDate,
    String? cvv,
  }) {
    // Mask card number except first 4 and last 4
    String displayCardNumber = cardNumber ?? "7986 **** **** 6985";
    if (displayCardNumber.replaceAll(' ', '').length >= 12) {
      final digits = displayCardNumber.replaceAll(' ', ' ');
      displayCardNumber =
          '${digits.substring(0, 4)} **** **** ${digits.substring(digits.length - 4)}';
    }
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3A7B4F), Color(0xFF6DB37F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Large circles for background
          Positioned(
            top: 18,
            left: 80,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 140,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bank name
          Positioned(
            top: 18,
            left: 24,
            child: Text(
              "A Bank",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 0.5,
              ),
            ),
          ),
          // Mastercard logo
          Positioned(
            top: 18,
            right: 24,
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCCF31),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Color(0xFFF55555),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Card number
          Positioned(
            top: 80,
            left: 24,
            child: Text(
              displayCardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Card holder label
          Positioned(
            bottom: 58,
            left: 24,
            child: Text(
              "CARD HOLDER",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
          ),
          // Card holder value
          Positioned(
            bottom: 42,
            left: 24,
            child: Text(
              (cardHolderName ?? "LOUIS ANDERSON").toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
          // Valid thru label
          Positioned(
            bottom: 58,
            right: 32,
            child: Text(
              "VALID THRU",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
          ),
          // Expiry value
          Positioned(
            bottom: 42,
            right: 32,
            child: Text(
              expiryDate ?? "06/25",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
          // CVV label
          Positioned(
            bottom: 18,
            right: 32,
            child: Text(
              "CVV",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
          ),
          // CVV value
          Positioned(
            bottom: 2,
            right: 32,
            child: Text(
              cvv ?? "***",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
