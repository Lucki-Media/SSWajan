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
    return Stack(
        clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: ArrowClipper(),
          child: Container(
            padding: EdgeInsets.only(left: 6,right: 45,top: 8),
            height: height,
            color: AppColors.kYellow,
            child: Text(
              text,style: AppFontStyles.headlineMedium(),
            ),
          ),
        ),
        Positioned(
          right: -35.0, // Set right to 0.0 for full width
          top: 0.0, // Set top to 0.0 for full height (optional)
          child: Image.asset(
            'assets/images/Bookmark.png',
            scale: 4, // Adjust scale as needed
          ),),
      ],
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
