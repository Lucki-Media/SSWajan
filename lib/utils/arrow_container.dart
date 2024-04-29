import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/app_font_styles.dart';

class ArrowContainer extends StatelessWidget {
  final double height;
  final String text;

  ArrowContainer({ required this.height, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 22,top: 8),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,bottomRight: Radius.circular(20)),
        color: AppColors.kYellow,
      ),
      child: Text(
        text,style: AppFontStyles.headlineMedium(),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 45, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width-45, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
