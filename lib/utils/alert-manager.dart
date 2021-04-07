import 'package:fluttertoast/fluttertoast.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/color.dart';

class AlertManager {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: primaryColor,
        textColor: HexColor("#FFFFFF"));
  }
}
