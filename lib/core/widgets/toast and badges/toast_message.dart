import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  void displayToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: RootColor.btnColor,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}
