import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/app_regexp.dart';
import 'package:flutter_advanced/modules/login/logic/login_cubit.dart';
import 'package:flutter_advanced/modules/login/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_validators.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/toggle/toggle_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordValidations();
  }

  void setupPasswordValidations() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegExp.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegExp.hasUpperCase(passwordController.text);
        hasNumber = AppRegExp.hasNumber(passwordController.text);
        hasSpecialCharacters = AppRegExp.hasSpecialCharacters(passwordController.text);
        hasMinLength = AppRegExp.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.validateEmail(
                context, context.read<LoginCubit>().emailController.text),
          ),
          verticalSpace(20),
          BlocBuilder<ToggleObscureTextCubit, ToggleObscureTextState>(
            builder: (BuildContext context, ToggleObscureTextState state) {
              return AppTextFormField(
                controller: passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => AppValidators.validatePassword(
                    context, passwordController.text),
                isObscureText: !state.value,
                suffixIcon: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ToggleObscureTextCubit>(context)
                        .toggleObscureText();
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
          verticalSpace(20),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
