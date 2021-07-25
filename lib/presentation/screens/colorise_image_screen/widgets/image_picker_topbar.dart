import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/carre_button.dart';

class ImagePickerTopBar extends StatelessWidget {
  const ImagePickerTopBar({
    Key key,
    @required this.onPickImageFromGalleryButtonClicked,
  }) : super(key: key);

  final Function onPickImageFromGalleryButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0.sp,
      left: 10.0.sp,
      right: 10.0.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarreButton(
            color: ColorPalette.snowWhite.withOpacity(0.5),
            icon: LineIcons.arrowLeft,
            iconcolor: ColorPalette.snowWhite.withOpacity(0.8),
            onTap: () => Navigator.pop(context),
          ),
          CarreButton(
            icon: LineIcons.photoVideo,
            iconcolor: ColorPalette.snowWhite.withOpacity(0.8),
            color: ColorPalette.snowWhite.withOpacity(0.5),
            onTap: onPickImageFromGalleryButtonClicked,
          ),
        ],
      ),
    );
  }
}
