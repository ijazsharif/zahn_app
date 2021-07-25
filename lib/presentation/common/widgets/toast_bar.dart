import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

showToastBar({@required BuildContext ctx, @required String message}) {
  return Toast.show(
    message,
    ctx,
    duration: 2,
    gravity: Toast.BOTTOM,
    backgroundRadius: 5.0,
    backgroundColor: ColorPalette.neonBlue.withOpacity(0.8),
  );
}
