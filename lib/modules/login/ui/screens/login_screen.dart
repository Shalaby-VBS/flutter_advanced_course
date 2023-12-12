import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/colors_manager.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_advanced/core/widgets/app_text_form_field.dart';
import 'package:flutter_advanced/modules/login/logic/toggle_cubit/toggle_cubit.dart';
import 'package:flutter_advanced/modules/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/already_have_account_text.dart';

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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    verticalSpace(16),
                    BlocBuilder<ToggleCubit, ToggleState>(
                      builder: (BuildContext context, ToggleState state) {
                        return AppTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          isObscureText: !state.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              BlocProvider.of<ToggleCubit>(context).toggle();
                            },
                            child: state.value == false
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorsManager.grey,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: ColorsManager.mainBlue,
                                    size: 20,
                                  ),
                          ),
                        );
                      },
                    ),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.size13BlueRegular,
                          ),
                        ),
                        // remember me
                        BlocBuilder<RememberMeCubit, RememberMeState>(
                          builder:
                              (BuildContext context, RememberMeState state) {
                            return Row(
                              children: [
                                Text(
                                  'Remember me',
                                  style: TextStyles.size12GreyRegular,
                                ),
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  value: state.value,
                                  activeColor: ColorsManager.mainBlue,
                                  onChanged: (value) {
                                    BlocProvider.of<RememberMeCubit>(context)
                                        .toggle();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          debugPrint('Login');
                        }
                      },
                    ),
                    verticalSpace(24),
                    const TermsAndConditionsText(),
                    verticalSpace(50),
                    const AlreadyHaveAccountText(),
                    verticalSpace(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
