import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_quickly_desige/constant/Common_text_field.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_button.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

class SupportScreenBottomData extends StatefulWidget {
  const SupportScreenBottomData({super.key});

  @override
  State<SupportScreenBottomData> createState() =>
      _SupportScreenBottomDataState();
}

class _SupportScreenBottomDataState extends State<SupportScreenBottomData> {
  @override
  Widget build(BuildContext context) {
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: CommonText(
              text: "QUICK CONTACT",
              fontSize: fo15,
              fontWeight: fBoldFont,
              fontColor: blackColor),
        ),
        mqHeight10.ph,
        CommonText(
            text: "Name",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight10,
        ),
        const CommonTextFormField1(
          // initialValue: StorageHelper().getUserName(),
          hintText: "Ex. Eman Fathima",
        ),
        mqHeight20.ph,
        CommonText(
            text: "Email",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight10,
        ),
        const CommonTextFormField1(
          // initialValue: StorageHelper().getUserName(),
          hintText: "example@domain.com",
        ),
        mqHeight20.ph,
        CommonText(
            text: "Phone",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight10,
        ),
        const CommonTextFormField1(
          // initialValue: StorageHelper().getUserName(),
          hintText: "Ex. +968 7216 2709",
        ),
        mqHeight20.ph,
        CommonText(
            text: "Message",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: mqWidth10),
          height: mq.height * .2,
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
            maxLines: 15,
            cursorColor: primaryColor,
            style: GoogleFonts.leagueSpartan(
                fontSize: fo15, color: blackColor, fontWeight: f400),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Add your query or requests",
            ),
          ),
        ),
        mqHeight20.ph,
        const Align(
            alignment: Alignment.center, child: CommonButton(text: "SUBMIT")),
      ],
    );
  }
}
