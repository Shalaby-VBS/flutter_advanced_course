import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extenstions.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_advanced/modules/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_advanced/modules/signup/ui/widgets/already_have_account_text.dart';
import 'package:flutter_advanced/modules/signup/ui/widgets/signup_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/clickable_text_span.dart';
import '../../logic/signup_cubit.dart';
import '../widgets/signup_bloc_listener.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              verticalSpace(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Account', style: TextStyles.size24BlueBold),
                  verticalSpace(8),
                  Text(
                    '''Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!''',
                    style: TextStyles.size14GreyRegular,
                  ),
                ],
              ),
              verticalSpace(36),
              Column(
                children: [
                  const SignupForm(),
                  verticalSpace(24),
                  AppTextButton(
                    text: 'Create Account',
                    onPressed: () {
                      validateAndSignup(context);
                    },
                  ),
                  verticalSpace(24),
                  const TermsAndConditionsText(),
                  verticalSpace(24),
                  ClickableTextSpan(
                    preClickableText: 'Already have an account?',
                    clickableText: 'Login',
                    onTap: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                  ),
                  verticalSpace(20),
                  const SignupBlocListener(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
