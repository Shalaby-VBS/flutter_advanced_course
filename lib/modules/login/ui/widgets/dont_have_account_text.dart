import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Don\'t have an account? ',
        style: TextStyles.size13DarkBlueRegular,
        children: [
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.size13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
