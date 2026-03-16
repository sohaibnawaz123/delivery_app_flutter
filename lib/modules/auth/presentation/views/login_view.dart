import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/forgetpassword_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/views/forgetpassword_view.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/checkbox_widget.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/social_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  final LoginBloc bloc;
  const LoginView({super.key, required this.bloc});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              heading: "Sign In Your Account",
              subheading: "Please sign in to continue",
            ),
            SizedBox(height: 30),
            LoginFieldsWidget(),
            SizedBox(height: 30),
            AppButton(title: 'Sign In', radius: 50),
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
              data: "Don't have an account? ",
              textStyle: context.bodyText,
              color: AppColor.baseText,
            ),
            GestureDetector(
              onTap: () {
                context.popPage();
              },
              child: Content(
                data: "Sign Up",
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

class LoginFieldsWidget extends StatelessWidget {
  const LoginFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
        Row(
          children: [
            CheckBoxWidget(text: 'Remember Me', onChanged: (value) {}),
            Spacer(),
            GestureDetector(
              onTap: () {
                context.pushPage(
                  ForgetpasswordView(
                    bloc: getIt<ForgetpasswordBloc>(
                      param1: ForgetpasswordViewInitialParams(),
                    ),
                  ),
                );
              },
              child: Content(
                data: "Forgot Password?",
                textStyle: context.bodyText,
                color: AppColor.primary,
                weight: AppFontWeight.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
