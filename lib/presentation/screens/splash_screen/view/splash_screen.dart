import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahn_app/core/helpers/notification_helper.dart';
import 'package:zahn_app/logic/app_bloc/app_bloc.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/particles_background.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppBloc>(context).add(
      RunStartupChecker(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotificationHelper _notificationHelper = NotificationHelper();
    _notificationHelper.showNotfication(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppRunForTheFirstTime) {
            Navigator.pushNamed(context, 'intro');
          }
          if (state is AppIsConnected) {
            Navigator.pushNamed(context, 'home');
          }
          if (state is AppIsNotConnected) {
            Navigator.pushNamed(context, 'disconnected');
          }
        },
        child: Stack(
          children: [
            ParticlesBackground(color: ColorPalette.neonBlue),
            Flash(
              infinite: true,
              duration: Duration(seconds: 2),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/trian.svg',
                  height: 60.0.sp,
                  color: ColorPalette.snowWhite.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
