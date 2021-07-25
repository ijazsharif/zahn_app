import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/carre_button.dart';
import 'package:zahn_app/presentation/common/widgets/toast_bar.dart';

showDeleteImageBar({
  @required BuildContext context,
  @required DataBaseHelper dataBaseHelper,
  @required int index,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0.sp, vertical: 18.0.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            color: ColorPalette.ruby.withOpacity(0.7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delete Photo From Record',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 10.0.sp),
              ),
              CarreButton(
                icon: LineIcons.trash,
                iconcolor: ColorPalette.ruby,
                color: ColorPalette.snowWhite,
                onTap: () {
                  dataBaseHelper.deleteColorizedPhoto(index: index);
                  showToastBar(
                      ctx: context, message: 'Photo Deleted From Record');
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
