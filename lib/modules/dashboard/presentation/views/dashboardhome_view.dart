import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardhome/dashboardhome_bloc.dart';

class DashboardhomeView extends StatelessWidget {
  final DashboardhomeBloc bloc;
  const DashboardhomeView({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.base,
      alignment: Alignment.center,
      child: const Text(
        'Dashboard Home',
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
