import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/text_styles.dart';
import '../../logic/toggle/toggle_cubit.dart';

class ForgetPasswordAndRememberMeRow extends StatelessWidget {
  const ForgetPasswordAndRememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Forgot Password?',
          style: TextStyles.size13BlueRegular,
        ),
        Row(
          children: [
            Text(
              'Remember me',
              style: TextStyles.size12GreyRegular,
            ),
            horizontalSpace(5),
            BlocBuilder<ToggleRememberMeCubit, ToggleRememberMeState>(
              builder: (context, state) {
                return SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Checkbox(
                    materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    value: state.value,
                    activeColor: ColorsManager.mainBlue,
                    onChanged: (value) {
                      BlocProvider.of<ToggleRememberMeCubit>(context)
                          .toggleRememberMe();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
