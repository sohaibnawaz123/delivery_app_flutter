import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/accountsetting/accountsetting_bloc.dart';


class AccountsettingView extends StatefulWidget {
  final AccountsettingBloc bloc;
  const AccountsettingView({
    super.key,
    required this.bloc,
  });

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
      backgroundColor: AppColor.base,

      
    );
  
  }
}
