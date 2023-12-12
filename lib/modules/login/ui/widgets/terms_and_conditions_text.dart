import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By logging, you agree to our ',
        style: TextStyles.size13GreyRegular,
        children: [
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyles.size13DarkBlueMedium,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.size13GreyRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.size13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
