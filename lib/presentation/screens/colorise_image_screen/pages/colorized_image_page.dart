import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/logic/colorization_bloc/colorization_bloc.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/widgets/downlaod_button.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/widgets/header.dart';

class ColorizedImagePage extends StatefulWidget {
  final PageController pageController;
  ColorizedImagePage({@required this.pageController});
  @override
  _ColorizedImagePageState createState() => _ColorizedImagePageState();
}

class _ColorizedImagePageState extends State<ColorizedImagePage> {
  final String fileName = 'ZAHN-ColorizedPhoto-File-' +
      DateFormat("MMMM-dd-hh-mm-ss").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, 'home');
        return false;
      },
      child: BlocBuilder<ColorizationBloc, ColorizationState>(
        buildWhen: (previous, current) => current is SuccessfullyColorizeImage,
        builder: (context, state) {
          if (state is SuccessfullyColorizeImage) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(state.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(
                    color: ColorPalette.fogra.withOpacity(0.3),
                    child: Stack(
                      children: [
                        Container(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0.sp,
                            vertical: 50.0.sp,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Header(),
                              SizedBox(height: 20.0.sp),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(state.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      width: 2,
                                      color: ColorPalette.snowWhite,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0.sp),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      fileName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            fontSize: 11.0.sp,
                                            color: ColorPalette.dimGrey,
                                          ),
                                    ),
                                  ),
                                  SizedBox(width: 5.0.w),
                                  DownloadButton(imageUrl: state.imageUrl),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 12.0.sp,
                animating: false,
              ),
            );
          }
        },
      ),
    );
  }
}
