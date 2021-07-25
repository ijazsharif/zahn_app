import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class NoContentFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 3),
              infinite: true,
              child: SvgPicture.asset(
                'assets/svg/astro.svg',
                height: 35.0.sp,
                color: ColorPalette.dimGrey,
              ),
            ),
            SizedBox(height: 3.0.h),
            ZoomIn(
              child: Text(
                'Your collection of colorized Photos is empty. to add new photo press the button below.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: ColorPalette.dimGrey, fontSize: 10.0.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
