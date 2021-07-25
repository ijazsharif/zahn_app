import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class AlertBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
        height: 55.0.sp,
        width: 55.0.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPalette.ruby,
        ),
        child: Flash(
          duration: Duration(seconds: 3),
          infinite: true,
          child: Icon(
            LineIcons.wifi,
            color: ColorPalette.snowWhite,
            size: 40.0.sp,
          ),
        ),
      ),
    );
  }
}
