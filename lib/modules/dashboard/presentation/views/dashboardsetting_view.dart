import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardsetting/dashboardsetting_bloc.dart';

class DashboardsettingView extends StatelessWidget {
  final DashboardsettingBloc bloc;
  const DashboardsettingView({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      alignment: Alignment.center,
      child: const Text(
        'Dashboard Setting',
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
