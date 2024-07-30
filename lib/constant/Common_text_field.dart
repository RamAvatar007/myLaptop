import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
import 'font_style.dart';
import 'mq_constant.dart';

class CommonTextFormField1 extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final String? initialValue;
  final bool? obscureText;
  final dynamic controller;
  const CommonTextFormField1(
      {super.key,
      this.hintText,
      this.suffixText,
      this.initialValue,
      this.obscureText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mqWidth10),
      height: mqHeight40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: black27Color.withOpacity(.2),
              offset: const Offset(3, 3),
              blurRadius: 6.0,
            ),
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: primaryColor,
        initialValue: initialValue,
        style: GoogleFonts.leagueSpartan(
            fontSize: fo15, color: blackColor, fontWeight: f400),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixText: suffixText,
          suffixStyle: GoogleFonts.leagueSpartan(
              fontSize: fo15, color: primaryColor, fontWeight: f400),
        ),
      ),
    );
  }
}
