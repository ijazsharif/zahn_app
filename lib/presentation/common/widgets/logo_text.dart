import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'ZAHN',
        style: Theme.of(context)
            .textTheme
            .headline1
            .copyWith(fontSize: 30.0.sp, letterSpacing: 4.0),
        children: <TextSpan>[
          TextSpan(
            text: '.',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 40.0.sp, color: ColorPalette.neonBlue),
          )
        ],
      ),
    );
  }
}
