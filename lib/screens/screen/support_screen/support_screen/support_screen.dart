import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

import 'support_screen_bottom_data.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: whiteColor,

      ///---------------App Bar---------------///
      appBar: AppBar(
        title: CommonText1(
            text: "Support",
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

      ///---------------Body---------------///
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqWidth15),
          child: Column(
            children: [
              mqHeight10.ph,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: mqHeight100,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(phoneSvg),
                            mqHeight10.ph,
                            CommonText(
                                text: "CALL US",
                                fontSize: fo12,
                                fontWeight: fBoldFont,
                                fontColor: blackColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  mqWidth15.pw,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: mqHeight100,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(whatsAppSvg),
                            mqHeight10.ph,
                            CommonText(
                                text: "WHATSAPP",
                                fontSize: fo12,
                                fontWeight: fBoldFont,
                                fontColor: blackColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  mqWidth15.pw,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: mqHeight100,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(chatSvg),
                            mqHeight10.ph,
                            CommonText(
                                text: "CHAT",
                                fontSize: fo12,
                                fontWeight: fBoldFont,
                                fontColor: blackColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              mqHeight30.ph,
              const SupportScreenBottomData(),
            ],
          ),
        ),
      ),
    );
  }
}
