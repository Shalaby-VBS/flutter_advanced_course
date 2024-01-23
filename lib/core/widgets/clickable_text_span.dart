import 'package:flutter/material.dart';

import '../themes/text_styles.dart';

class ClickableTextSpan extends StatelessWidget {
  final String preClickableText;
  final String clickableText;
  final VoidCallback onTap;

  const ClickableTextSpan({
    super.key,
    required this.clickableText,
    required this.onTap,
    required this.preClickableText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            preClickableText,
            style: TextStyles.size13DarkBlueRegular,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              clickableText,
              style: TextStyles.size13BlueSemiBold,
            ),
          )
        ],
      ),
    );
  }
}
