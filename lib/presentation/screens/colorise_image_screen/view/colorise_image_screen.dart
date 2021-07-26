import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zahn_app/logic/colorization_bloc/colorization_bloc.dart';
import 'package:zahn_app/presentation/common/widgets/toast_bar.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/pages/colorized_image_page.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/pages/image_picker_page.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/pages/progress_page.dart';

class ColorizeImageScreen extends StatefulWidget {
  @override
  _ColorizeImageScreenState createState() => _ColorizeImageScreenState();
}

class _ColorizeImageScreenState extends State<ColorizeImageScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ColorizationBloc, ColorizationState>(
        listenWhen: (previous, current) =>
            current is SuccessfullyColorizeImage ||
            current is FailedToColorizeImage ||
            current is Colorization,
        listener: (context, state) {
          if (state is Colorization) {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          }
          if (state is FailedToColorizeImage) {
            showToastBar(
              ctx: context,
              message: 'Failed To Colorize Your Photo',
            );
            Navigator.pushNamed(context, 'colorizeImage');
          }
          if (state is SuccessfullyColorizeImage) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        },
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ImagePickerPage(pageController: _pageController),
            ProgressPage(pageController: _pageController),
            ColorizedImagePage(pageController: _pageController),
          ],
        ),
      ),
    );
  }
}
