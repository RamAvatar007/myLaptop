import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

class AboutQuickly extends StatefulWidget {
  const AboutQuickly({super.key});

  @override
  State<AboutQuickly> createState() => _AboutQuicklyState();
}

class _AboutQuicklyState extends State<AboutQuickly> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: whiteColor,
      ///--------------- App Bar ---------------///
      appBar: AppBar(
        title: CommonText1(
            text: "About Quickly",
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

      ///--------------- Body ---------------///
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqWidth15),
        child: Center(
          child: Column(
            children: [
              mqHeight20.ph,
              SizedBox(
                width: mqWidth75,
                height: mqHeight75,
                child: Image.asset(
                  logoImage,
                  fit: BoxFit.fill,
                ),
              ),
              mqHeight20.ph,
              CommonText(
                  text: "Version 1.0.0.1",
                  fontSize: fo18,
                  fontWeight: fBoldFont,
                  fontColor: primaryColor),
              mqHeight2.ph,
              CommonText(
                  text: "Production Version",
                  fontSize: fo12,
                  fontWeight: f400,
                  fontColor: blackColor),
              mqHeight25.ph,
              CommonText(
                  text:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores.",
                  fontSize: fo15,
                  fontWeight: f400,
                  fontColor: blackColor),
              mqHeight15.ph,
              CommonText(
                  text:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores.",
                  fontSize: fo15,
                  fontWeight: f400,
                  fontColor: blackColor),
              Flexible(child: Container()),
              CommonText(
                  text: "©Quickly App 2023",
                  fontSize: fo15,
                  fontWeight: f400,
                  fontColor: blackColor),
              mqHeight15.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: mqHeight15,
                      width: mqWidth15,
                      child: Image.asset(
                        twitterLogoImage,
                        fit: BoxFit.fill,
                      )),
                  mqWidth15.pw,
                  SizedBox(
                      height: mqHeight20,
                      width: mqWidth20,
                      child: Image.asset(
                        fbLogoImage,
                        fit: BoxFit.fill,
                      )),
                ],
              ),
              mqHeight20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
