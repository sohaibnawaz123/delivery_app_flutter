import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/modules/onboarding/presentation/widget/onboarding_template.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';

class OnboardingView extends StatefulWidget {
  final OnboardingBloc bloc;
  const OnboardingView({super.key, required this.bloc});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,
      body: OnboardingTemplate(
        title: 'Fast Delivery',
        imagepath: AppAsset.fastDelivery,
        content:
            'Experience lightning-fast delivery with our efficient service.',
      ),
    );
  }
}
