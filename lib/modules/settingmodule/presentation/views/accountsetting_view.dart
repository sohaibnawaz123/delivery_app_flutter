import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/accountsetting/accountsetting_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsettingView extends StatefulWidget {
  final AccountsettingBloc bloc;
  const AccountsettingView({super.key, required this.bloc});

  @override
  State<AccountsettingView> createState() => _AccountsettingViewState();
}

class _AccountsettingViewState extends State<AccountsettingView> {
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HeaderWidget(title: 'Account Settings'),
            const SizedBox(height: 30),
            const FeildsSection(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          0,
          context.pagePadding.right,
          context.pagePadding.bottom,
        ),
        child: AppButton(title: "Save Changes",radius: 30,),
      ),
    );
  }
}

class FeildsSection extends StatelessWidget {
  const FeildsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.primary,
              child: const Icon(Icons.person, size: 50, color: AppColor.white),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: AppColor.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: LabelContentFeild(
                labelStyle: context.bodyText.copyWith(
                  color: AppColor.black.withOpacity(0.7),
                  fontWeight: AppFontWeight.medium,
                  fontSize: 14.h,
                ),
                labelText: 'First Name',
                hintText: 'Enter your first name',
                fillColor: AppColor.highlight,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),

            Expanded(
              child: LabelContentFeild(
                labelStyle: context.bodyText.copyWith(
                  color: AppColor.black.withOpacity(0.7),
                  fontWeight: AppFontWeight.medium,
                  fontSize: 14.h,
                ),
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                fillColor: AppColor.highlight,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        LabelContentFeild(
          labelStyle: context.bodyText.copyWith(
            color: AppColor.black.withOpacity(0.7),
            fontWeight: AppFontWeight.medium,
            fontSize: 14.h,
          ),
          labelText: 'Email',
          hintText: 'Enter your email address',
          fillColor: AppColor.highlight,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        SizedBox(height: 10.h),
        LabelContentFeild(
          labelStyle: context.bodyText.copyWith(
            color: AppColor.black.withOpacity(0.7),
            fontWeight: AppFontWeight.medium,
            fontSize: 14.h,
          ),
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          fillColor: AppColor.highlight,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
