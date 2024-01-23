import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Already have an account? ',
        style: TextStyles.size13DarkBlueRegular,
        children: [
          TextSpan(
            text: 'Sign In',
            style: TextStyles.size13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
