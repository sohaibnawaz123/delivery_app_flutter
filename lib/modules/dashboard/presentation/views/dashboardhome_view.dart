import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/home_header.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardhome/dashboardhome_bloc.dart';

class DashboardhomeView extends StatelessWidget {
  final DashboardhomeBloc bloc;
  const DashboardhomeView({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        MediaQuery.of(context).padding.top,
        context.pagePadding.right,
        context.pagePadding.bottom,
      ),
      child: ListView(
        children: [
          HomeHeader(),
          SizedBox(height: 20),
          Content(
            data: 'Ready to order?',
            textStyle: context.headingText.copyWith(
              color: AppColor.primaryText,
              fontWeight: FontWeight.w600,
            ),
            size: 28,
          ),
          SizedBox(height: 5),
          SearchFilter(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
