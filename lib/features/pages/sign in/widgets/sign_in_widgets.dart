import 'package:flutter/material.dart';

Widget thirdPartyLogin() {
  return Container(
    margin:
        const EdgeInsets.only(left: 80.0, right: 80.0, top: 40.0, bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/facebook.png"),
        _loginButton("assets/icons/apple.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagepath) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.0,
      width: 40.0,
      child: Image.asset(imagepath),
    ),
  );
}
