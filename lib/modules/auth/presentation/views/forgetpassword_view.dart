import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/otpverify/otpverify_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/otpverify_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/views/otpverify_view.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetpasswordView extends StatefulWidget {
  final ForgetpasswordBloc bloc;
  const ForgetpasswordView({super.key, required this.bloc});

  @override
  State<ForgetpasswordView> createState() => _ForgetpasswordViewState();
}

class _ForgetpasswordViewState extends State<ForgetpasswordView> {
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
          // context.pagePadding.bottom,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerLeft, child: AuthHeader()),
            SizedBox(height: 30),
            AuthTitleHeader(
              heading: "Forget Password",
              subheading:
                  "Please enter your email to receive a link to create a new password via email",
            ),
            SizedBox(height: 30),
            LabelContentFeild(
              labelText: 'Email Address',
              suffixIcon: Icon(
                Icons.email_outlined,
                color: AppColor.primary,
                size: 24.h,
              ),
              hintText: 'Enter your email',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 14,
              ),
              fillColor: AppColor.highlight,
            ),
            SizedBox(height: 30),
            AppButton(
              title: 'Send Code',
              radius: 50,
              onTap: () {
                context.pushPage(
                  OtpverifyView(
                    bloc: getIt<OtpverifyBloc>(
                      param1: OtpverifyViewInitialParams(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                context.popPage();
              },

              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Go back to ",
                  style: context.bodyText.copyWith(
                    color: AppColor.baseText,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: context.bodyText.copyWith(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
