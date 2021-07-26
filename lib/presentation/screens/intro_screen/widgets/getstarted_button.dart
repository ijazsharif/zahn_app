import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/logic/app_bloc/app_bloc.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class GetSatrtedBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3.0.h),
        height: 6.7.h,
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: ColorPalette.neonBlue,
            primary: ColorPalette.woodSmoke,
          ),
          onPressed: () {
            BlocProvider.of<AppBloc>(context).add(
              CheckAppConnectivity(),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 10.0.sp, letterSpacing: 2.0),
              ),
              SizedBox(width: 4.0.w),
              Icon(
                LineIcons.arrowRight,
                color: ColorPalette.snowWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
