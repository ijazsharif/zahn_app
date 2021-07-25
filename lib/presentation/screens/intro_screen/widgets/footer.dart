import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              ColorPalette.woodSmoke.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        padding: EdgeInsets.all(20.0.sp),
        child: child,
      ),
    );
  }
}
