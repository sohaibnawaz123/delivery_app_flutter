import 'package:delivery_app/component/button/app_button.dart';
import 'package:delivery_app/component/text_field/label_content_feild.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_header.dart';
import 'package:delivery_app/modules/auth/presentation/widgets/auth_title_header.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/resetpassword/resetpassword_bloc.dart';


class ResetpasswordView extends StatefulWidget {
  final ResetpasswordBloc bloc;
  const ResetpasswordView({
    super.key,
    required this.bloc,
  });

  @override
  State<ResetpasswordView> createState() => _ResetpasswordViewState();
}

class _ResetpasswordViewState extends State<ResetpasswordView> {
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
              heading: "Reset Your Password",
              subheading:
                  "Please enter your new password to reset your password",
            ),
            SizedBox(height: 30),
            ResetPasswordFeilds(),
            SizedBox(height: 30),
            AppButton(
              title: 'Reset Password',
              radius: 50,
              
            ),
            
          ],
        ),
      ),
    );
  }
}

class ResetPasswordFeilds extends StatelessWidget {
  const ResetPasswordFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LabelContentFeild(
          labelText: 'New Password',
          obscureText: true,
          hintText: 'Enter your new password',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
        SizedBox(height: 20),
        LabelContentFeild(
          labelText: 'Confirm Password',
          obscureText: true,
          hintText: 'Re-enter your new password',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          fillColor: AppColor.highlight,
        ),
      ],
    );
  }
}