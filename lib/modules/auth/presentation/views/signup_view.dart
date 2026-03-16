import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/checkbox_widget.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/social_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  final SignupBloc bloc;
  const SignupView({super.key, required this.bloc});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
              ? 0
              : 10,
          // MediaQuery.of(context).viewInsets.bottom < 0
          //     ? context.pagePadding.bottom
          //     : MediaQuery.of(context).padding.bottom +
          //           context.pagePadding.bottom,
          // context.pagePadding.bottom,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerLeft, child: AuthHeader()),
            SizedBox(height: 30),
            AuthTitleHeader(
              heading: "Create Your Account",
              subheading: "Please sign up to continue",
            ),
            SizedBox(height: 30),
            SignUpFieldsWidget(),
            SizedBox(height: 30),
            AppButton(title: 'Sign Up', radius: 50),
            SizedBox(height: 30),
            OrWidget(),
            SizedBox(height: 30),
            SocialSignUp(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: context.pagePadding.bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Content(
              data: "Already have an account? ",
              textStyle: context.bodyText,
              color: AppColor.baseText,
            ),
            GestureDetector(
              onTap: () {
                context.popPage();
              },
              child: Content(
                data: "Sign In",
                textStyle: context.bodyText,
                color: AppColor.primary,
                weight: AppFontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpFieldsWidget extends StatelessWidget {
  const SignUpFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LabelContentFeild(
          labelText: 'Full Name',
          suffixIcon: Icon(
            Icons.person_outline,
            color: AppColor.primary,
            size: 24.h,
          ),
          hintText: 'Enter your full name',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          labelText: 'Email Address',
          suffixIcon: Icon(
            Icons.email_outlined,
            color: AppColor.primary,
            size: 24.h,
          ),
          hintText: 'Enter your email',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          labelText: 'Password',
          obscureText: true,
          // suffixIcon: Icon( Icons.lock_outline, color: AppColor.primary,size: 24.h,),
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        CheckBoxWidget(text: 'I agree to the Terms and Conditions', onChanged: (value) {}),
      ],
    );
  }
}
