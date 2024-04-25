import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_styles.dart';

class CommonTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final bool enabled;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String labelText;
  final Widget? suffixIcon;
  const CommonTextFormField({Key? key, this.textInputAction, this.onTap, this.validator, this.onChanged, required this.labelText, this.suffixIcon, this.enabled = true, this.initialValue, this.controller}) : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller ,
      initialValue:widget.initialValue ,
      onChanged:widget.onChanged,
      validator: widget.validator,
        keyboardType: TextInputType.number,
      textInputAction: widget.textInputAction,
      textAlign: TextAlign.left,
      cursorColor: AppColors.kBlack,
      onTap: widget.onTap,
      enabled: widget.enabled,
      decoration: InputDecoration(
        isDense:true ,
        contentPadding:  EdgeInsets.symmetric(horizontal: 8,vertical:(widget.suffixIcon == null) ? 12 : 0 ),
        labelText: widget.labelText,
        labelStyle: AppFontStyles.bodyMedium(
        ),
        suffixIcon:widget.suffixIcon,
        suffixIconConstraints:BoxConstraints(
          minWidth: 42,
          minHeight: 42,
        ),
        filled: true,
        fillColor: widget.enabled ? AppColors.kWhite: AppColors.kMidGrey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kGrey, width: 1),
            ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kGrey.withOpacity(.23), width: 1),
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kGrey.withOpacity(.23), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kBlack.withOpacity(.40), width: 1),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kRed, width: 1),
        ),
      ),
      style: AppFontStyles.bodyMedium(color: AppColors.kBlack)
    );
  }
}
