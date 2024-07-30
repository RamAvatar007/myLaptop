import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_rich_text_league_spartan.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

class SavedItemScreenBottomData extends StatefulWidget {
  const SavedItemScreenBottomData({super.key});

  @override
  State<SavedItemScreenBottomData> createState() =>
      _SavedItemScreenBottomDataState();
}

class _SavedItemScreenBottomDataState extends State<SavedItemScreenBottomData> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return mqHeight10.ph;
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: mqWidth5,
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
                  width: mqWidth65,
                  height: mqHeight75,
                  child: Image.asset(
                    appleLogoImage,
                    fit: BoxFit.cover,
                  ),
                ),
                mqWidth10.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: mq.width - (mqWidth15 + mqWidth65 + mqWidth40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: 'Head Lamp',
                                fontSize: fo15,
                                fontWeight: fBoldFont,
                                fontColor: blackColor,
                              ),
                              CommonText(
                                text: 'Toyota, Land Cruiser',
                                fontSize: fo12,
                                fontWeight: f400,
                                fontColor: black57Color,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CommonText(
                                text: 'OMR 1,512',
                                fontSize: fo15,
                                fontWeight: f400,
                                fontColor: primaryColor,
                              ),
                              CommonRichTextLeagueSpartan(
                                  text1: "2,000 ",
                                  text2: "10%",
                                  fontSize: fo12,
                                  color1: brown98Color,
                                  color2: green66Color),
                            ],
                          ),
                        ],
                      ),
                    ),
                    mqHeight10.ph,
                    CommonText(
                      text: 'Mechanical Part - CFKH2585',
                      fontSize: fo12,
                      fontWeight: f400,
                      fontColor: brown9fColor,
                    ),
                    mqHeight15.ph,
                    Row(children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: mqWidth5),
                          height: mqHeight30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                                  Icons.delete_outline,
                                  color: primaryColor,
                                  size: 21,
                                ),
                                mqWidth2.pw,
                                CommonText(
                                    text: "Remove from Saved",
                                    fontSize: fo14,
                                    fontWeight: f400,
                                    fontColor: blackColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                      mqWidth10.pw,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: mqWidth5),
                          height: mqHeight30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                                mqWidth2.pw,
                                CommonText(
                                    text: "Move to Cart",
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
        });
  }
}
