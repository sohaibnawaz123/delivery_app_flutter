import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/settingmodule/presentation/blocs/myorders/myorders_bloc.dart';


class MyordersView extends StatefulWidget {
  final MyordersBloc bloc;
  const MyordersView({
    super.key,
    required this.bloc,
  });

  @override
  State<MyordersView> createState() => _MyordersViewState();
}

class _MyordersViewState extends State<MyordersView> {
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
