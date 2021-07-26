import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';
import 'package:zahn_app/presentation/common/widgets/toast_bar.dart';

class DownloadButton extends StatefulWidget {
  DownloadButton({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool isLoading = false;
  DataBaseHelper _dataBaseHelper = DataBaseHelper();
  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      duration: Duration(seconds: 2),
      child: Container(
        height: 37.0.sp,
        width: 37.0.sp,
        child: TextButton(
          onPressed: () async {
            if (!isLoading) {
              setState(() {
                isLoading = true;
              });
              try {
                String imageId = await ImageDownloader.downloadImage(
                  widget.imageUrl,
                );

                String path = await ImageDownloader.findPath(imageId);
                _dataBaseHelper.saveColorizedPhoto(filePath: path);
                showToastBar(
                  ctx: context,
                  message: 'Photo Saved To Your Gallery',
                );

                Navigator.pushNamed(context, 'home');
              } catch (_) {
                showToastBar(
                  ctx: context,
                  message: 'Failed Save Photo to gallery',
                );
              }
              setState(() {
                isLoading = false;
              });
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: ColorPalette.snowWhite,
            primary: ColorPalette.woodSmoke,
          ),
          child: isLoading
              ? CupertinoActivityIndicator()
              : Icon(
                  LineIcons.download,
                  size: 20.0.sp,
                  color: ColorPalette.woodSmoke,
                ),
        ),
      ),
    );
  }
}
