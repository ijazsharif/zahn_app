import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ZAHN',
          style: Theme.of(context).textTheme.headline3.copyWith(
                fontSize: 12.0.sp,
                letterSpacing: 1.0,
                color: ColorPalette.neonBlue.withOpacity(0.5),
              ),
        ),
        SizedBox(height: 7.0.sp),
        Text(
          'Your Photo is successfuly colorized'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(fontSize: 12.0.sp, letterSpacing: 1.0),
        ),
      ],
    );
  }
}
