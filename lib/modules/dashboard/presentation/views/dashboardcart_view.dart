import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardcart/dashboardcart_bloc.dart';

class DashboardcartView extends StatelessWidget {
  final DashboardcartBloc bloc;
  const DashboardcartView({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.base,
      alignment: Alignment.center,
      child: const Text(
        'Dashboard Cart',
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
