import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/status_tile/statustile.dart';
import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/network/api_status.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/auth/domain/params/signup_param.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/otpverify/otpverify_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/otpverify_view_initial_params.dart';
import 'package:delivery_app/modules/auth/presentation/views/otpverify_view.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/checkbox_widget.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/social_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupView extends StatefulWidget {
  final SignupBloc bloc;
  const SignupView({super.key, required this.bloc});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

   @override
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
          MediaQuery.of(context).viewInsets.bottom < 0 ? 0 : 10,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Align(alignment: Alignment.centerLeft, child: AuthHeader()),
            SizedBox(height: 30),
            AuthTitleHeader(
              heading: "Create Your Account",
              subheading: "Please sign up to continue",
            ),
            SizedBox(height: 30),
            SignUpFieldsWidget(
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              emailController: _emailController,
              passwordController: _passwordController,
              confirmpasswordController: _confirmpasswordController,
              phoneController: _phoneController,
            ),
            SizedBox(height: 30),
            BlocConsumer<SignupBloc, SignupState>(
              bloc: widget.bloc,
              listenWhen: (previous, current) =>
                  previous.signupResponse != current.signupResponse,
              buildWhen: (previous, current) =>
                  previous.signupResponse != current.signupResponse,
              listener: (context, state) {
                if (state.signupResponse.status == ApiStatus.completed) {
                  Fluttertoast.showToast(
                    msg: state.signupResponse.message ?? 'Signup successful',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: AppColor.primary,
                    textColor: AppColor.white,
                  );
                  context.pushPage(
                    OtpverifyView(
                      bloc: getIt<OtpverifyBloc>(
                        param1: OtpverifyViewInitialParams(),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.signupResponse.status == ApiStatus.error)
                      StatusTile(
                        error:
                            state.signupResponse.message ?? 'An error occurred',
                        isButton: true,
                      ),
                    AppButton(
                      title: 'Sign Up',
                      radius: 50,
                      isLoading:
                          state.signupResponse.status == ApiStatus.loading,
                      onTap: () {
                        widget.bloc.add(
                          LoadSignupEvent(
                            SignupParam(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phoneNumber: _phoneController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmpasswordController.text,
                              deviceToken: 'qwerty',
                              fcmToken: 'qwertyu',
                              email: _emailController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
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
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmpasswordController;
  final TextEditingController phoneController;

  const SignUpFieldsWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmpasswordController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: LabelContentFeild(
                controller: firstNameController,
                labelText: 'First Name',
                suffixIcon: Icon(
                  Icons.person_outline,
                  color: AppColor.primary,
                  size: 24.h,
                ),
                hintText: 'Enter your first name',
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                fillColor: AppColor.highlight,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: LabelContentFeild(
                controller: lastNameController,
                labelText: 'Last Name',
                suffixIcon: Icon(
                  Icons.person_outline,
                  color: AppColor.primary,
                  size: 24.h,
                ),
                hintText: 'Enter your last name',
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                fillColor: AppColor.highlight,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          controller: phoneController,
          labelText: 'Phone Number',
          suffixIcon: Icon(
            Icons.phone_outlined,
            color: AppColor.primary,
            size: 24.h,
          ),
          hintText: 'Enter your phone number',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          controller: emailController,
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
          controller: passwordController,
          labelText: 'Password',
          obscureText: true,
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          controller: confirmpasswordController,
          labelText: 'Confirm Password',
          obscureText: true,
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        CheckBoxWidget(
          text: 'I agree to the Terms and Conditions',
          onChanged: (value) {},
        ),
      ],
    );
  }
}
