import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_advanced/modules/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/login_request_body.dart';
import '../../logic/login_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/forget_password_and_remember_me_row.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MARK: - Variables.
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(
            children: [
              verticalSpace(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back!', style: TextStyles.size24BlueBold),
                  verticalSpace(8),
                  Text(
                      '''We're excited to have you back, can't wait to see what you've been up to since you last logged in.''',
                      style: TextStyles.size14GreyRegular),
                ],
              ),
              verticalSpace(36),
              Column(
                children: [
                  const LoginForm(),
                  verticalSpace(20),
                  const ForgetPasswordAndRememberMeRow(),
                  verticalSpace(24),
                  AppTextButton(
                    text: 'Login',
                    onPressed: () {
                      validateAndLogin(context);
                    },
                  ),
                  verticalSpace(24),
                  const TermsAndConditionsText(),
                  verticalSpace(50),
                  const AlreadyHaveAccountText(),
                  verticalSpace(20),
                  const LoginBlocListener(),
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
