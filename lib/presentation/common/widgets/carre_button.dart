import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class CarreButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconcolor;
  final Function onTap;
  final double raduis;

  CarreButton({
    @required this.icon,
    @required this.iconcolor,
    @required this.color,
    @required this.onTap,
    this.raduis,
  });
  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      duration: Duration(seconds: 2),
      child: Container(
        height: 34.0.sp,
        width: 34.0.sp,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: color,
            primary: ColorPalette.woodSmoke,
          ),
          child: Icon(
            icon,
            size: 20.0.sp,
            color: iconcolor,
          ),
        ),
      ),
    );
  }
}
