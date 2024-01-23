import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/themes/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final String hintText;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  const AppTextFormField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.isObscureText,
        this.hintStyle,
        this.inputTextStyle,
        this.contentPadding,
        this.fillColor,
        this.focusNode,
        required this.validator, this.keyboardType, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: fillColor ?? ColorsManager.transparentGrey,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.size14LightGreyRegular,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
          const BorderSide(color: ColorsManager.lightGrey, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.blue, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
        prefixIcon: prefixIcon == null ? null :
        Icon(prefixIcon, color: ColorsManager.grey),
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.size14DarkBlueMeduim,
    );
  }
}
