import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class ImageCrasoualSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      unlimitedMode: true,
      autoSliderDelay: Duration(seconds: 2),
      enableAutoSlider: true,
      slideTransform: CubeTransform(),
      itemCount: 3,
      slideBuilder: (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/showcase$index.png',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Container(
            color: ColorPalette.fogra.withOpacity(0.6),
          ),
        );
      },
    );
  }
}
