import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/app_regexp.dart';
import 'package:flutter_advanced/modules/login/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_validators.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/logic/toggle/toggle_cubit.dart';
import '../../logic/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    confirmPasswordController = context.read<SignupCubit>().confirmPasswordController;
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
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: 'Name',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            prefixIcon: Icons.person,
            validator: (value) => AppValidators.validateName(
                context, context.read<SignupCubit>().nameController.text),
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: 'Phone Number',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone_outlined,
            validator: (value) => AppValidators.validatePhoneNumber(
                context, context.read<SignupCubit>().phoneController.text),
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.validateEmail(
                context, context.read<SignupCubit>().emailController.text),
          ),
          verticalSpace(20),
          BlocBuilder<ToggleObscureTextCubit, ToggleObscureTextState>(
            builder: (BuildContext context, ToggleObscureTextState state) {
              return Column(
                children: [
                  AppTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    textInputAction: TextInputAction.next,
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
                  ),
                  verticalSpace(20),
                  AppTextFormField(
                    controller: context.read<SignupCubit>().confirmPasswordController,
                    hintText: "Confirm Password",
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => AppValidators.validatePassword(
                        context, context.read<SignupCubit>().confirmPasswordController.text),
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
                  ),
                ],
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
