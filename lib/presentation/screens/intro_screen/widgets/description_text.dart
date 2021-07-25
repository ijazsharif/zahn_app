import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ZAHN help your memories back by colorizing black and white family & historic photos',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 10.0.sp,
                letterSpacing: 1.0,
                height: 1.5,
              ),
        ),
        SizedBox(height: 3.0.sp),
        Text(
          'we use an advanced artificial intelligence algorithme Developed and Designed specifically to colorize black & white photos',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 10.0.sp,
                color: ColorPalette.snowWhite.withOpacity(0.6),
                letterSpacing: 1.0,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
