import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/joinus/joinus_bloc.dart';
import 'package:delivery_app/modules/onboarding/presentation/routes/joinus_view_initial_params.dart';
import 'package:delivery_app/modules/onboarding/presentation/views/joinus_view.dart';
import 'package:delivery_app/modules/onboarding/presentation/widgets/onboarding_screen_widget.dart';
import 'package:delivery_app/modules/onboarding/presentation/widgets/paginationIndicator.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatefulWidget {
  final OnboardingBloc bloc;
  const OnboardingView({super.key, required this.bloc});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final List<OnboardingData> onboardingData = [
    OnboardingData(
      imageUrl: AppAsset.fastDelivery,
      heading: 'Fast Delivery',
      subHeading: null,
      content: 'Experience lightning-fast delivery with our efficient service.',
    ),
    OnboardingData(
      imageUrl: AppAsset.find,
      heading: 'Find Your Food',
      subHeading: null,
      content:
          'Discover a wide variety of delicious meals from local restaurants.',
    ),
    OnboardingData(
      imageUrl: AppAsset.easyPay,
      heading: 'Easy Payment',
      subHeading: null,
      content:
          'Enjoy hassle-free payments with multiple secure options available.',
    ),
    // OnboardingData(
    //   imageUrl: AppAsset.joinUs,
    //   heading: 'Join Us',
    //   subHeading: null,
    //   content:
    //       'Become part of our community and enjoy exclusive offers and rewards.',
    // ),
  ];
  final PageController controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: AppColor.highlight,
      body: BlocProvider.value(
        value: widget.bloc,
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (previous, current) =>
              previous.currentPageIndex != current.currentPageIndex,
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    widget.bloc.add(UpdateCurrentPageIndexEvent(index));
                  },
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    final isActive = index == state.currentPageIndex;
                    return RepaintBoundary(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        opacity: isActive ? 1 : 0.5,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          scale: isActive ? 1 : 0.96,
                          child: OnboardingScreenWidget(
                            imageUrl: data.imageUrl!,
                            heading: data.heading!,
                            subHeadingText: data.subHeading,
                            content: data.content,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: onboardingData.length,
                ),
                Positioned(
                  bottom: MediaQuery.sizeOf(context).height * 0.33,
                  left: 0,
                  right: 0,
                  child: paginationIndicator(
                    onboardingData.length,
                    state.currentPageIndex,
                  ),
                ),
                Positioned(
                  top: 65,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      context.pushPage(
                        JoinusView(
                          bloc: getIt<JoinusBloc>(
                            param1: JoinusViewInitialParams(),
                          ),
                        ),
                      );
                    },

                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.primary, width: 2),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                if (state.currentPageIndex > 0)
                  Positioned(
                    top: 70,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        if (state.currentPageIndex > 0) {
                          controller.animateToPage(
                            state.currentPageIndex - 1,
                            duration: const Duration(milliseconds: 450),
                            curve: Curves.easeOutCubic,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: MediaQuery.of(context).viewPadding.bottom < 0.0
                      ? 20
                      : MediaQuery.of(context).viewPadding.bottom + 20,
                  // bottom: MediaQuery.of(context).size.height * 0.07,
                  child: AppButton(
                    onTap: () async {
                      if (state.currentPageIndex < onboardingData.length - 1) {
                        await controller.animateToPage(
                          state.currentPageIndex + 1,
                          duration: const Duration(milliseconds: 450),
                          curve: Curves.easeOutCubic,
                        );
                      } else {
                        context.pushPage(
                          JoinusView(
                            bloc: getIt<JoinusBloc>(
                              param1: JoinusViewInitialParams(),
                            ),
                          ),
                        );
                        // Navigate to the next screen or perform any action after the last page
                      }
                    },
                    title: state.currentPageIndex == onboardingData.length - 1
                        ? 'Get Started'
                        : '',
                    iconPath:
                        state.currentPageIndex == onboardingData.length - 1
                        ? null
                        : AppAsset.arrow,
                    width: state.currentPageIndex == onboardingData.length - 1
                        ? 170
                        : 75,
                    height: state.currentPageIndex == onboardingData.length - 1
                        ? 50
                        : 75,
                    radius: state.currentPageIndex == onboardingData.length - 1
                        ? 18
                        : 50,
                    iconSize: 20,
                    padding: state.currentPageIndex == onboardingData.length - 1
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.all(25),
                    borderColor: AppColor.primary,
                    buttonColor: AppColor.primary,
                    fontColor: AppColor.white,
                    borderWidth: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OnboardingData {
  final String? imageUrl;
  final String? heading;
  final String? subHeading;
  final String? content;

  OnboardingData({
    required this.imageUrl,
    required this.heading,
    required this.subHeading,
    required this.content,
  });
}
