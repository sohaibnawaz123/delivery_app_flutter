import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/routes/signup_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/views/login_view.dart';
import 'package:delivery_app/modules/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/joinus/joinus_bloc.dart';
import 'package:flutter_svg/svg.dart';

class JoinusView extends StatefulWidget {
  final JoinusBloc bloc;
  const JoinusView({super.key, required this.bloc});

  @override
  State<JoinusView> createState() => _JoinusViewState();
}

class _JoinusViewState extends State<JoinusView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.highlight,
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              AppAsset.joinUs,
              width: 300,
              fit: BoxFit.contain,
              color: AppColor.primary,
            ),
          ),
          // const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(
              context.pagePadding.left,
              20,
              context.pagePadding.right,
              MediaQuery.of(context).viewInsets.bottom < 0
                  ? 30
                  : MediaQuery.of(context).padding.bottom + 30,
            ),
            // height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColor.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColor.highlight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),

                Content(
                  data: 'Join Us Or Sign In',
                  color: AppColor.highlightText,
                  textStyle: context.headingText,
                  size: 32,
                ),
                const SizedBox(height: 20),
                Content(
                  data:
                      'Become part of our community and enjoy exclusive offers and rewards.',
                  color: AppColor.black,
                  alignment: TextAlign.center,
                  textStyle: context.bodyText,
                  size: 16,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      title: 'Sign In',
                      width: MediaQuery.sizeOf(context).width * 0.43,
                      radius: 50,
                      onTap: () => context.pushPage(
                        LoginView(
                          bloc: getIt<LoginBloc>(
                            param1: LoginViewInitialParams(),
                          ),
                        ),
                      ),
                    ),
                    AppButton(
                      title: 'Sign Up',
                      // isResponsiveWidth: true,
                      width: MediaQuery.sizeOf(context).width * 0.43,
                      buttonColor: AppColor.highlight,
                      fontColor: AppColor.black,
                      radius: 50,
                      onTap: () => context.pushPage(
                        SignupView(
                          bloc: getIt<SignupBloc>(
                            param1: SignupViewInitialParams(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
