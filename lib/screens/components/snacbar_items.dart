import 'package:flutter/material.dart';
import 'package:mirror_energy/screens/components/styles.dart';


class SnackbarItems{
  static errorToast(String msg) {
    return SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.red,
      duration: Duration(seconds:2),
    );
  }
  static successToast(String msg) {
    return SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white),),
      backgroundColor: color,
      duration: Duration(seconds:2),
    );
  }
}