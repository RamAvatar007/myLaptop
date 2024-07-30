import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_quickly_desige/main.dart';
import 'app_color.dart';
import 'font_style.dart';

class CommonButton extends StatelessWidget {
  final String text;
  const CommonButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width * .5,
      height: mq.height * .05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: primaryColor),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.leagueSpartan(
            color: whiteColor,
            fontSize: fo15,
            fontWeight: f400,
            decoration: TextDecoration.none),
      )),
    );
  }
}
