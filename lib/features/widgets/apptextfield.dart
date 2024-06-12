import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';
import 'package:riverpod_udemy1/features/widgets/appimage.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

Widget appTextfield(
    {TextEditingController? controller,
    String text = "",
    String iconNmae = "",
    String hinteTxt = "",
    bool obscuretext = false,
    void Function(String value)? func}) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxshadowTextfield(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: appimage(
                  imagepath: iconNmae,
                ),
              ),
              SizedBox(
                width: 280.w,
                height: 50.h,
                child: TextField(
                  controller: controller,
                  onChanged: (value) => func!(value),
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscuretext,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 4.h, left: 4.w),
                    hintText: hinteTxt,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextfieldOnly(
    {String hinteTxt = "type your info",
    double width = 280,
    bool obscureText = false,
    double height = 50,
    TextEditingController? controller,
    void Function(String value)? func}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hinteTxt,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    ),
  );
}
