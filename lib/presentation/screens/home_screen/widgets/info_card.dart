import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/screens/home_screen/widgets/delete_image_bar.dart';

class ColorizedImageCard extends StatefulWidget {
  ColorizedImageCard({
    Key key,
    @required this.filePath,
    @required this.position,
  }) : super(key: key);

  final String filePath;
  final int position;

  @override
  _ColorizedImageCardState createState() => _ColorizedImageCardState();
}

class _ColorizedImageCardState extends State<ColorizedImageCard> {
  final DataBaseHelper _dataBaseHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDeleteImageBar(
        context: context,
        dataBaseHelper: _dataBaseHelper,
        index: widget.position,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 5.0.sp),
        padding: EdgeInsets.all(10.0.sp),
        decoration: BoxDecoration(
          color: ColorPalette.dimGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Container(
              width: 65.0.sp,
              height: 65.0.sp,
              decoration: BoxDecoration(
                color: ColorPalette.snowWhite,
                image: DecorationImage(
                  image: FileImage(File(widget.filePath)),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: ColorPalette.snowWhite,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            SizedBox(width: 15.0.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#0' + (widget.position + 1).toString(),
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: 12.0.sp, color: ColorPalette.neonBlue),
                  ),
                  SizedBox(
                    height: 5.0.sp,
                  ),
                  Text(
                    widget.filePath.substring(20, widget.filePath.length),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontSize: 10.3.sp, letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
