import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/resetpassword/resetpassword_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/resetpassword_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/views/resetpassword_view.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/otpverify/otpverify_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpverifyView extends StatefulWidget {
  final OtpverifyBloc bloc;
  const OtpverifyView({super.key, required this.bloc});

  @override
  State<OtpverifyView> createState() => _OtpverifyViewState();
}

class _OtpverifyViewState extends State<OtpverifyView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          context.pagePadding.top,
          context.pagePadding.right,
          MediaQuery.of(context).viewInsets.bottom < 0
              ? context.pagePadding.bottom
              : MediaQuery.of(context).padding.bottom +
                    context.pagePadding.bottom,
        ),
        child: ListView(
          children: [
            Align(alignment: Alignment.centerLeft, child: AuthHeader()),
            SizedBox(height: 30),
            AuthTitleHeader(
              heading: "Enter your OTP",
              subheading: "Please enter the OTP sent to your email",
            ),
            SizedBox(height: 30),
            Align(alignment: Alignment.center, child: OTPFeild()),
            SizedBox(height: 30),
            AppButton(
              title: 'Verify',
              radius: 50,
              onTap: () {
                context.pushPage(
                  ResetpasswordView(
                    bloc: getIt<ResetpasswordBloc>(
                      param1: ResetpasswordViewInitialParams(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OTPFeild extends StatelessWidget {
  const OTPFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColor.highlight.withOpacity(0.35),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColor.primary.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: PinCodeTextField(
        pinBoxWidth: 60,
        pinBoxHeight: 60,
        maxLength: 4,
        pinBoxRadius: 16,
        pinBoxBorderWidth: 1.2,
        defaultBorderColor: AppColor.primary.withOpacity(0.25),
        pinBoxColor: AppColor.white,
        highlightPinBoxColor: AppColor.highlight,
        onTextChanged: (text) {
          // Handle text change if needed
        },
        onDone: (text) {
          // Handle OTP submission
        },
        pinTextStyle: context.subHeadingText.copyWith(
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        pinTextAnimatedSwitcherTransition:
            ProvidedPinBoxTextAnimation.scalingTransition,
        pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
