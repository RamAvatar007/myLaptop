import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final dynamic textAlign;
  final dynamic decoration;
  final int? maxLine;

  const CommonText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.fontColor,  this.textAlign, this.decoration, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 5,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.leagueSpartan(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          decoration: decoration ?? TextDecoration.none),
    );
  }
}

class CommonText1 extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLine;
  final dynamic textAlign;
  const CommonText1(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.fontColor, this.maxLine, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 5,
      overflow: TextOverflow.clip,
      textAlign: textAlign,
      style: GoogleFonts.playfairDisplay(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          decoration: TextDecoration.none),
    );
  }
}
