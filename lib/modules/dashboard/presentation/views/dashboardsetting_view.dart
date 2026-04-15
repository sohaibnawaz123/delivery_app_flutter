import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/setting_listTile.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardsetting/dashboardsetting_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardsettingView extends StatelessWidget {
  final DashboardsettingBloc bloc;
  DashboardsettingView({super.key, required this.bloc});

  final List<SettingListTileEntity> settingItems = [
    SettingListTileEntity(title: 'Account Settings', iconPath: AppAsset.profile, child: null),
    SettingListTileEntity(title: 'My Orders', iconPath: AppAsset.order, child: null),
    SettingListTileEntity(
      title: 'My Addresses',
      iconPath: AppAsset.location,
      child: null,
    ),
    SettingListTileEntity(
      title: 'Payment Methods',
      iconPath: AppAsset.payment,
      child: null,
    ),
    SettingListTileEntity(title: 'My Vouchers', iconPath: AppAsset.voucher, child: null),
    SettingListTileEntity(title: 'Invite Friends', iconPath: AppAsset.inviteFriend, child: null),
    SettingListTileEntity(
      title: 'Notification Settings',
      iconPath: AppAsset.notification,
      child: null,
    ),
    SettingListTileEntity(title: 'Privacy Settings', iconPath: AppAsset.privacy, child: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            HeaderWidget(title: 'Profile Setting', showBackButton: false),
            SizedBox(height: 20.h),
            Align(alignment: Alignment.center, child: ProfilePicture()),
            SizedBox(height: 20.h),
            Expanded(child: SettingItemList(items: settingItems)),
            SizedBox(height: 10.h),
            AppButton(
              title: "logout",
              radius: 30,
              iconPath: AppAsset.logout,

            )

          ],
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
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
              ),
              radius: 50,
              backgroundColor: AppColor.primary.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColor.highlight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  color: AppColor.primary,
                  size: 16,
                ),
              ),
            ),
          ],
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
      itemBuilder: (context, index) {
        return SettingListTile(entity: items[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: items.length,
    );
  }
}
