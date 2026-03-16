import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.popPage();
      },
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.primary,
          // borderRadius: BorderRadius.circular(20),
          shape: BoxShape.circle,
          
        ),
        child: Icon(Icons.arrow_back_rounded, color: AppColor.white),
      ),
    );
  }
}
