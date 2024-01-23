import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extenstions.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/signup_cubit.dart';
import '../../logic/signup_state.dart';


class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
                content: Text('Account created successfully 🎉'),
              ),
            );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        title: Text('Error', style: TextStyles.size15DarkBlueMedium),
        content: Text(error, style: TextStyles.size14BlueSemiBold),
        actions: [
          AppTextButton(
            text: 'Got it',
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
