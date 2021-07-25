import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class AlertText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Text(
        'This application needs access to the internet to function properly.\nPlease connect to the internet and restart the application.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 10.2.sp,
              letterSpacing: 1.0,
              color: ColorPalette.dimGrey,
              height: 1.5,
            ),
      ),
    );
  }
}
