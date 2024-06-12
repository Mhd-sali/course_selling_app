import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo([String msg = ""]) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    textColor: const Color.fromARGB(255, 255, 255, 255),
    fontSize: 16,
  );
}
