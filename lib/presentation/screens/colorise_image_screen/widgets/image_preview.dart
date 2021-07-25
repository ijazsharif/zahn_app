import 'dart:io';
import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/carre_button.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    Key key,
    @required this.selectedImage,
    @required this.onConfirm,
    @required this.onCancel,
  }) : super(key: key);

  final String selectedImage;
  final Function onConfirm;
  final Function onCancel;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, 'colorizeImage');
        return false;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(
              File(selectedImage),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              color: ColorPalette.fogra.withOpacity(0.7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.0.sp),
                    BounceInDown(
                      duration: Duration(seconds: 2),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 200,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: FileImage(
                              File(selectedImage),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CarreButton(
                          icon: LineIcons.trash,
                          iconcolor: ColorPalette.woodSmoke,
                          color: ColorPalette.snowWhite,
                          onTap: onCancel,
                          raduis: 60.0,
                        ),
                        CarreButton(
                          icon: LineIcons.doubleCheck,
                          iconcolor: ColorPalette.snowWhite,
                          color: ColorPalette.neonBlue,
                          onTap: onConfirm,
                          raduis: 60.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
