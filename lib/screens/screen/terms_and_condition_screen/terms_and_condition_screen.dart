import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--------------- App Bar ---------------///
      appBar: AppBar(
        title: CommonText1(
            text: "Terms And Conditions",
            fontSize: fo20,
            fontWeight: fBoldFont,
            fontColor: blackColor),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqWidth15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mqHeight20.ph,
            CommonText(
                text: "Cancelation Policy",
                fontSize: fo18,
                fontWeight: fBoldFont,
                fontColor: primaryColor),
            mqHeight10.ph,
            CommonText(
                text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,"
                    "sed diam nonumy eirmod tempor invidunt ut labore et"
                    "dolore magna aliquyam erat, sed diam voluptua. At vero eos et"
                    "accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,"
                    "no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum"
                    "dolor sit amet.",
                fontSize: fo15,
                textAlign: TextAlign.left,
                fontWeight: f400,
                fontColor: blackColor),
            mqHeight20.ph,
            CommonText(
                text: "Terms and Conditions",
                fontSize: fo18,
                fontWeight: fBoldFont,
                fontColor: primaryColor),
            mqHeight10.ph,
            CommonText(
                text:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed"
                    "diam nonumy eirmod tempor invidunt ut labore et dolore"
                    "magna aliquyam erat, sed diam voluptua. At vero eos et"
                    "accusam et justo duo dolores et ea rebum. Stet clita kasd"
                    "gubergren, no sea takimata sanctus est Lorem ipsum dolor"
                    "sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing"
                    "elitr, sed diam nonumy eirmod tempor invidunt ut labore et"
                    "dolore magna aliquyam erat, sed diam voluptua. At vero eos"
                    "et accusam et justo duo dolores et ea rebum. Stet clita kasd"
                    "gubergren, no sea takimata sanctus est Lorem ipsum dolor sit"
                    "amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,"
                    "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
                    "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo"
                    "duo dolores et ea rebum. Stet clita kasd gubergren, no sea"
                    "takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum"
                    "dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
                    "eirmod tempor invidunt ut labore et dolore magna aliquyam"
                    "erat, sed diam voluptua. At vero eos et accusam et justo"
                    "duo dolores et ea rebum. Stet clita kasd gubergren, no"
                    "sea takimata sanctus est Lorem ipsum.",
                fontSize: fo15,
                textAlign: TextAlign.left,
                fontWeight: f400,
                fontColor: blackColor),
          ],
        ),
      ),
    );
  }
}
