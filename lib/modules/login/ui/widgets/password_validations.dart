import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/themes/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  const PasswordValidations(
      {super.key,
        required this.hasLowerCase,
        required this.hasUpperCase,
        required this.hasNumber,
        required this.hasSpecialCharacters,
        required this.hasMinLength,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          hasValidated: hasLowerCase,
          text: 'At least one lower case letter.',
        ),
        verticalSpace(8),
        buildValidationRow(
          hasValidated: hasUpperCase,
          text: 'At least one upper case letter.',
        ),
        verticalSpace(8),
        buildValidationRow(
          hasValidated: hasNumber,
          text: 'At least one number.',
        ),
        verticalSpace(8),
        buildValidationRow(
          hasValidated: hasSpecialCharacters,
          text: 'At least one special character.',
        ),
        verticalSpace(8),
        buildValidationRow(
          hasValidated: hasMinLength,
          text: 'Minimum 6 characters.',
        ),
      ],
    );
  }

  Row buildValidationRow({
    required bool hasValidated,
    required String text,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Checkbox(
            materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            value: hasValidated,
            activeColor: Colors.green,
            onChanged: (value) {
              hasValidated = value ?? false;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        horizontalSpace(4),
        Text(
          text,
          style: TextStyles.size13DarkBlueRegular.copyWith(
            color: hasValidated ? Colors.green : ColorsManager.grey,
            decorationColor: hasValidated ? Colors.green : ColorsManager.grey,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
