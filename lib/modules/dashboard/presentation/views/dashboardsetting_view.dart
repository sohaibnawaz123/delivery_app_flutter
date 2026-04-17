import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/address_section-widget.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/payment_method_section.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/setting_listTile.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/accountsetting/accountsetting_bloc.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/myorders/myorders_bloc.dart';
import 'package:delivery_app/modules/settingmodule/presentation/routes/accountsetting_view_initial_params.dart';
import 'package:delivery_app/modules/settingmodule/presentation/routes/myorders_view_initial_params.dart';
import 'package:delivery_app/modules/settingmodule/presentation/views/accountsetting_view.dart';
import 'package:delivery_app/modules/settingmodule/presentation/views/myorders_view.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardsetting/dashboardsetting_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardsettingView extends StatefulWidget {
  final DashboardsettingBloc bloc;
  const DashboardsettingView({super.key, required this.bloc});

  @override
  State<DashboardsettingView> createState() => _DashboardsettingViewState();
}

class _DashboardsettingViewState extends State<DashboardsettingView> {
  final List<SettingListTileEntity> settingItems = [
    SettingListTileEntity(
      title: 'Account Settings',
      iconPath: AppAsset.profile,
      child: AccountsettingView(
        bloc: getIt<AccountsettingBloc>(
          param1: AccountsettingViewInitialParams(),
        ),
      ),
      actionType: SettingActionType.screen,
    ),
    SettingListTileEntity(
      title: 'My Orders',
      iconPath: AppAsset.order,
      child: MyordersView(
        bloc: getIt<MyordersBloc>(param1: MyordersViewInitialParams()),
      ),
      actionType: SettingActionType.screen,
    ),
    SettingListTileEntity(
      title: 'My Addresses',
      iconPath: AppAsset.location,
      child: AddressBottomSheet(),
      actionType: SettingActionType.bottomSheet,
    ),
    SettingListTileEntity(
      title: 'Payment Methods',
      iconPath: AppAsset.payment,
      child: PaymentBottomSheet(),
      actionType: SettingActionType.bottomSheet,
    ),
    SettingListTileEntity(
      title: 'My Vouchers',
      iconPath: AppAsset.voucher,
      child: null,
      actionType: SettingActionType.bottomSheet,
    ),
    SettingListTileEntity(
      title: 'Invite Friends',
      iconPath: AppAsset.inviteFriend,
      child: null,
      actionType: SettingActionType.bottomSheet,
    ),
    // SettingListTileEntity(
    //   title: 'Notification Settings',
    //   iconPath: AppAsset.notification,
    //   child: null,
    //   actionType: SettingActionType.bottomSheet,
    // ),
    // SettingListTileEntity(
    //   title: 'Privacy Settings',
    //   iconPath: AppAsset.privacy,
    //   child: PrivacysettingView(
    //     bloc: getIt<PrivacysettingBloc>(
    //       param1: PrivacysettingViewInitialParams(),
    //     ),
    //   ),
    //   actionType: SettingActionType.screen,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            context.pagePadding.left,
            context.pagePadding.top,
            context.pagePadding.right,
            context.pagePadding.bottom,
          ),
          child: Column(
            children: [
              HeaderWidget(
                title: 'Profile Setting',
                showBackButton: false,
                showactions: true,
                actions: [
                  AppButton(
                    isResponsiveHeight: true,
                    isResponsiveWidth: true,
                    radius: 30,
                    iconPath: AppAsset.logout,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Align(alignment: Alignment.center, child: ProfilePicture()),
              SizedBox(height: 20.h),
              SettingItemList(items: settingItems),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
          ),
          radius: 50,
          backgroundColor: AppColor.primary.withOpacity(0.1),
        ),
        SizedBox(height: 10.h),
        Content(
          data: 'User Name',
          textStyle: context.bodyText.copyWith(
            color: AppColor.black,
            fontWeight: AppFontWeight.semiBold,
          ),
          size: 20,
        ),
        SizedBox(height: 5.h),
        Content(
          data: 'support@example.com',
          textStyle: context.bodyText.copyWith(
            color: AppColor.baseText,
            fontWeight: AppFontWeight.medium,
          ),
          size: 16,
        ),
      ],
    );
  }
}

class SettingItemList extends StatelessWidget {
  final List<SettingListTileEntity> items;
  const SettingItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SettingListTile(entity: items[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: items.length,
    );
  }
}
