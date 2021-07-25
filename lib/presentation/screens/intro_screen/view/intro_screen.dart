import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahn_app/logic/app_bloc/app_bloc.dart';
import 'package:zahn_app/presentation/common/widgets/logo_text.dart';
import 'package:zahn_app/presentation/screens/intro_screen/widgets/description_text.dart';
import 'package:zahn_app/presentation/screens/intro_screen/widgets/footer.dart';
import 'package:zahn_app/presentation/screens/intro_screen/widgets/getstarted_button.dart';
import 'package:zahn_app/presentation/screens/intro_screen/widgets/image_crasoul_slider.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) =>
            current is AppIsConnected || current is AppIsNotConnected,
        listener: (context, state) {
          if (state is AppIsConnected) {
            Navigator.pushNamed(context, 'home');
          } else if (state is AppIsNotConnected) {
            Navigator.pushNamed(context, 'disconnected');
          }
        },
        child: Stack(
          children: [
            ImageCrasoualSlider(),
            Footer(
              child: Bounce(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoText(),
                    DescriptionText(),
                    GetSatrtedBotton(),
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
