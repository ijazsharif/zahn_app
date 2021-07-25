import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/particles_background.dart';
import 'package:zahn_app/presentation/screens/disconnected_screen/widgets/alert_badge.dart';
import 'package:zahn_app/presentation/screens/disconnected_screen/widgets/alert_text.dart';

class DisconnectedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            ParticlesBackground(color: ColorPalette.ruby),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlertBadge(),
                    SizedBox(height: 4.0.h),
                    AlertText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
