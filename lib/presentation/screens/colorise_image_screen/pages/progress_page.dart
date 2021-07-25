import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class ProgressPage extends StatefulWidget {
  final PageController pageController;
  ProgressPage({
    @required this.pageController,
  });
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  Timer timer;
  int passedSeconds = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) {
          setState(() {
            passedSeconds += 1;
          });
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 40.0.sp, vertical: 20.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flash(
                  duration: Duration(seconds: 3),
                  infinite: true,
                  child: SvgPicture.asset(
                    'assets/svg/trian.svg',
                    height: 60.0.sp,
                    color: ColorPalette.dimGrey,
                  ),
                ),
                SizedBox(height: 80.0.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Passed : ',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 12.0.sp,
                            height: 1.3,
                            color: ColorPalette.snowWhite,
                          ),
                    ),
                    Text(
                      passedSeconds.toString() + ' s',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 12.0.sp,
                            height: 1.3,
                            color: ColorPalette.neonBlue,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0.sp),
                Text(
                  'Be Patient while we Colorize your photo. operation might take a few moments',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 12.0.sp,
                      height: 1.3,
                      color: ColorPalette.dimGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
