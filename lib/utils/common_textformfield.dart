import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_styles.dart';

class CommonTextFormField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String labelText;
  final Widget? suffixIcon;
  const CommonTextFormField({Key? key,this.keyboardType, this.textInputAction, this.onTap, this.validator, this.onChanged, required this.labelText, this.suffixIcon}) : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textAlign: TextAlign.left,
      onTap: widget.onTap,
      decoration: InputDecoration(
        isDense:true ,
        contentPadding:  EdgeInsets.symmetric(horizontal: 18,vertical:(widget.suffixIcon == null) ? 12 : 0 ),
        labelText: widget.labelText,
        labelStyle: AppFontStyles.bodyMedium(
        ),
        suffixIcon:widget.suffixIcon,
        suffixIconConstraints:BoxConstraints(
          minWidth: 42,
          minHeight: 42,
        ),
        filled: true,
        fillColor: AppColors.kWhite,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kGrey, width: 1),
            ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kGrey.withOpacity(.23), width: 1),
            ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kYellow.withOpacity(.23), width: 1),
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
