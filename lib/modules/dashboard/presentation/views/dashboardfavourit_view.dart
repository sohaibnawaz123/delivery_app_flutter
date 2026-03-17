import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardfavourit/dashboardfavourit_bloc.dart';

class DashboardfavouritView extends StatelessWidget {
  final DashboardfavouritBloc bloc;
  const DashboardfavouritView({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.base,
      alignment: Alignment.center,
      child: const Text(
        'Dashboard Favourit',
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
