import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/privacysetting/privacysetting_bloc.dart';


class PrivacysettingView extends StatefulWidget {
  final PrivacysettingBloc bloc;
  const PrivacysettingView({
    super.key,
    required this.bloc,
  });

  @override
  State<PrivacysettingView> createState() => _PrivacysettingViewState();
}

class _PrivacysettingViewState extends State<PrivacysettingView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,

      
    );
  
  }
}
