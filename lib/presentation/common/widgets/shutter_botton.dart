import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class ShutterBotton extends StatelessWidget {
  final Function onTap;

  ShutterBotton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      duration: Duration(seconds: 2),
      child: Container(
        decoration: BoxDecoration(
            color: ColorPalette.snowWhite.withOpacity(0.3),
            shape: BoxShape.circle),
        padding: EdgeInsets.all(6.0.sp),
        child: RawMaterialButton(
          onPressed: onTap,
          fillColor: ColorPalette.snowWhite,
          child: Icon(
            LineIcons.retroCamera,
            size: 24.0.sp,
          ),
          padding: EdgeInsets.all(10.0.sp),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
