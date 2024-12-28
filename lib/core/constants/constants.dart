import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_theme/app_colors.dart';
import '../cache_helper/cache_keys.dart';
import '../cache_helper/shared_pref_methods.dart';

// import '../cache_manager/cache_keys.dart';
// import '../cache_manager/shared_preferences.dart';

// String imageToBase64(File image) {
//   List<int> bytes = image.readAsBytesSync();
//   return base64Encode(bytes);
// }

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: Container(
        padding: EdgeInsets.all(
          32.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.whiteColor,
        ),
        child: const CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => WillPopScope(
      child: alertDialog,
      onWillPop: () async {
        return true;
      },
    ),
    barrierDismissible: true,
  );
}

Future<void> showToast({
  required bool isError,
  required String message,
}) async {
  if (!isError) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      gravity: ToastGravity.SNACKBAR,
    );
  } else {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.SNACKBAR);
  }
}
