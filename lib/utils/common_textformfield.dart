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
   String? labelText;
   String? hintText;
  final Widget? suffixIcon;

   CommonTextFormField({Key? key,this.hintText,this.textInputAction, this.onTap, this.validator, this.onChanged,  this.labelText, this.suffixIcon, this.enabled = true, this.initialValue, this.controller}) : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
        focusNode: _focusNode,
      decoration: InputDecoration(
        isDense:true ,
        contentPadding:  EdgeInsets.symmetric(horizontal: 8,vertical:(widget.suffixIcon == null) ? 12 : 0 ),
       labelText: _isFocused ? widget.labelText : null,
       //labelText: widget.labelText ,
        labelStyle: AppFontStyles.splashSubText(
          color:  AppColors.kYellow,
          fontWeight: FontWeight.w500,
          fontSize: 9,
        ),
        // labelStyle: AppFontStyles.bodyMedium(
        //
        // ),
        suffixIcon:widget.suffixIcon,
        suffixIconConstraints:BoxConstraints(
          minWidth: 42,
          minHeight: 42,
        ),
        hintText: widget.hintText,
        // hintStyle: AppFontStyles.bodyMedium(
        //
        // ),
        hintStyle: AppFontStyles.splashSubText(
          color:  AppColors.kHintGrey,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
       filled: true,
        //fillColor: widget.enabled ? AppColors.kWhite: AppColors.kMidGrey,
        fillColor: widget.enabled ?  AppColors.kBlack.withOpacity(0.2):AppColors.kBorderGrey,
       //fillColor: AppColors.kBorderGrey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
         //borderSide: BorderSide(color: AppColors.kGrey, width: 1),
         borderSide: BorderSide(color: AppColors.kWhite, width: 1),
            ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          //borderSide: BorderSide(color: AppColors.kGrey.withOpacity(.23), width: 1),
          borderSide: BorderSide(color: AppColors.kWhite, width: 1),
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          //borderSide: BorderSide(color: AppColors.kGrey.withOpacity(.23), width: 1),
          borderSide: BorderSide(color: AppColors.kWhite, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          //borderSide: BorderSide(color: AppColors.kBlack.withOpacity(.40), width: 1),
          borderSide: BorderSide(color: AppColors.kYellow, width: 1),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.kRed, width: 1),
        ),
      ),
     style: AppFontStyles.bodyMedium(color: AppColors.kWhite)
    );
  }
}
