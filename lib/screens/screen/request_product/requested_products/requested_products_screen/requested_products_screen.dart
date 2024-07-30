import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_button.dart';
import 'package:new_quickly_desige/constant/common_rich_text_league_spartan.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

class RequestedProductScreen extends StatefulWidget {
  const RequestedProductScreen({super.key});

  @override
  State<RequestedProductScreen> createState() => _RequestedProductScreenState();
}

class _RequestedProductScreenState extends State<RequestedProductScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      ///------------------app bar -----------------///
      appBar: AppBar(
        title: CommonText1(
            text: "Requested Product",
            fontSize: fo20,
            fontWeight: fBoldFont,
            fontColor: blackColor),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: whiteColor,
      ),

      ///------------------floating action button -----------------///
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CommonButton(
        text: 'ADD NEW REQUEST',
      ),

      ///------------------body -----------------///
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) {
            return mqHeight10.ph;
          },
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: mqWidth15),
              padding: EdgeInsets.symmetric(
                horizontal: mqWidth15,
                vertical: mqHeight20,
              ), //EdgeInsets.all(mqHeight10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: black27Color.withOpacity(.2),
                    blurRadius: 6,
                    offset: const Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mqWidth90,
                    height: mqHeight90,
                    child: Image.asset(
                      appleLogoImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  mqWidth10.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: 'Head Lamp',
                            fontSize: fo15,
                            fontWeight: fBoldFont,
                            fontColor: blackColor,
                          ),
                          CommonText(
                            text: 'Request Id : 46516',
                            fontSize: fo12,
                            fontWeight: f400,
                            fontColor: brown98Color,
                          ),
                        ],
                      ),
                      CommonText(
                        text: 'Toyota, Land Cruiser',
                        fontSize: fo12,
                        fontWeight: f400,
                        fontColor: black57Color,
                      ),
                      mqHeight10.ph,
                      CommonRichTextLeagueSpartan(
                          text1: "Status : ",
                          text2: "Available Now",
                          fontSize: fo12,
                          color1: blackColor,
                          color2: green2cColor),
                      mqHeight15.ph,
                      Row(children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: mqWidth80,
                            height: mqHeight30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: orange77Color, width: 1),
                            ),
                            child: Center(
                              child: CommonText(
                                  text: "Cancel",
                                  fontSize: fo14,
                                  fontWeight: f400,
                                  fontColor: orange77Color),
                            ),
                          ),
                        ),
                        mqWidth10.pw,
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: mqWidth120,
                            height: mqHeight30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black27Color.withOpacity(.2),
                                  blurRadius: 6,
                                  offset: const Offset(
                                      3, 3), // changes position of shadow
                                ),
                              ],
                              color: whiteColor,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: primaryColor,
                                    size: 21,
                                  ),
                                  mqWidth5.pw,
                                  CommonText(
                                      text: "Shop now",
                                      fontSize: fo14,
                                      fontWeight: f400,
                                      fontColor: blackColor),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
