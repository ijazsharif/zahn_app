import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class AlertMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Text(
          'The application needs access to your device camera to take a photo and colorize it.\nin case you denied access click top botton on the right to pick a photo from gallery',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.headline3.copyWith(
                fontSize: 10.0.sp,
                color: ColorPalette.dimGrey,
                letterSpacing: 1.0,
                height: 1.5,
              ),
        ),
      ),
    );
  }
}
