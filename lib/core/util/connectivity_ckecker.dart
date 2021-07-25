import 'dart:io';

Future<bool> connectivityStatusChecker() async {
  try {
    var result = await InternetAddress.lookup('deepai.org');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
