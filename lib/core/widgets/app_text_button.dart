import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors_manager.dart';
import 'package:flutter_advanced/core/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  const AppTextButton(
      {super.key,
        required this.text,
        required this.onPressed,
        this.backgroundColor,
        this.height,
        this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? ColorsManager.mainBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(width?.w ?? double.maxFinite, height?.h ?? 52.h),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.size16WhiteSemiBold,
      ),
    );
  }
}
