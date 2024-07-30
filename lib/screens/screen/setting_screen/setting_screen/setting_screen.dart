import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/auth_screens/sign_in_screen/view/signin_screen.dart';
import 'package:new_quickly_desige/screens/screen/setting_screen/setting_provider/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Consumer<SettingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: CommonText1(
              text: "Settings",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontColor: blackColor,
            ),
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
          backgroundColor: whiteColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: mqHeight15),
            child: Column(
              children: [
                mqHeight20.ph,
                Container(
                  height: mqHeight45,
                  width: mq.width,
                  padding: EdgeInsets.symmetric(horizontal: mqHeight15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.1),
                        blurRadius: 6,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_outlined, color: blackColor),
                      mqWidth10.pw,
                      CommonText(text: "Turn on notification", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                      Flexible(child: Container()),
                      SizedBox(
                        height: 15,
                        child: CupertinoSwitch(
                          activeColor: primaryColor,
                          value: value.turnOnNotification,
                          onChanged: value.updateTurnOnNotification,
                        ),
                      ),
                    ],
                  ),
                ),
                mqHeight15.ph,
                Container(
                  height: mqHeight40,
                  width: mq.width,
                  padding: EdgeInsets.symmetric(horizontal: mqHeight15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.1),
                        blurRadius: 6,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.subject_sharp, color: blackColor),
                      mqWidth10.pw,
                      CommonText(text: "Subscribe newsletter", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                      Flexible(child: Container()),
                      CupertinoSwitch(
                        activeColor: primaryColor,
                        value: value.subscribeNewsletter,
                        onChanged: value.updateSubscribeNewsletter,
                      ),
                    ],
                  ),
                ),
                mqHeight15.ph,
                Container(
                  width: mq.width,
                  padding: EdgeInsets.symmetric(horizontal: mqHeight15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.1),
                        blurRadius: 6,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      mqHeight10.ph,
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Icon(Icons.switch_account_outlined, color: blackColor),
                        mqWidth10.pw,
                        CommonText(
                          text: 'Switch Language',
                          fontSize: fo15,
                          fontWeight: f400,
                          fontColor: blackColor,
                        )
                      ]),
                      mqHeight10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(text: "عربي", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                          Radio(
                            value: "عربي",
                            activeColor: primaryColor,
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              return primaryColor;
                            }),
                            groupValue: value.language,
                            onChanged: (val) {
                              value.updateLanguage(val ?? " ");
                            },
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        width: mq.width,
                        color: shadowColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(text: "English", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                          Radio(
                              value: "English",
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                return primaryColor;
                              }),
                              groupValue: value.language,
                              onChanged: (val) {
                                value.updateLanguage(val ?? " ");
                              }),
                        ],
                      ),
                      mqHeight10.ph,
                    ],
                  ),
                ),
                mqHeight15.ph,
                Container(
                  height: mqHeight40,
                  width: mq.width,
                  padding: EdgeInsets.symmetric(horizontal: mqHeight15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.1),
                        blurRadius: 6,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.center_focus_weak_outlined, color: blackColor),
                      mqWidth10.pw,
                      CommonText(text: "Enable Face ID", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                      Flexible(child: Container()),
                      CupertinoSwitch(
                        activeColor: primaryColor,
                        value: value.enableFaceID,
                        onChanged: value.updateEnableFaceID,
                      ),
                    ],
                  ),
                ),
                mqHeight15.ph,
                GestureDetector(
                  onTap: () {
                    bottomModelSheet();
                  },
                  child: Container(
                    height: mqHeight40,
                    width: mq.width,
                    padding: EdgeInsets.symmetric(horizontal: mqHeight15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: black27Color.withOpacity(.1),
                          blurRadius: 6,
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_outlined, color: blackColor),
                        mqWidth10.pw,
                        CommonText(text: "Delete Account", fontSize: fo15, fontWeight: f400, fontColor: blackColor),
                        Flexible(child: Container()),
                        Icon(Icons.arrow_forward_ios_outlined, color: primaryColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///-------------------------show bottom model sheet------------------------///
  void bottomModelSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: primaryColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        builder: (context) {
          return ListView(shrinkWrap: true, children: [
            mqHeight25.ph,
            CommonText1(text: "Delete Account", fontSize: fo25, fontWeight: fBoldFont, fontColor: whiteColor),
            mqHeight10.ph,
            CommonText(
                text: "Are You Sure Want To Permanently Delete Your Account? This Action Can't Be Undone And Your Data Will Be Deleted Permanently.",
                fontSize: fo15,
                fontWeight: f400,
                fontColor: whiteColor),
            mqHeight15.ph,
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: mq.width * .35,
                  height: mqHeight40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: whiteColor, width: 1),
                  ),
                  child: Center(
                    child: CommonText(text: "Cancel", fontSize: fo14, fontWeight: f400, fontColor: whiteColor),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  StorageHelper().sp?.clear();
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
                child: Container(
                  width: mq.width * .35,
                  height: mqHeight40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: CommonText(text: "YES, DELETE", fontSize: fo14, fontWeight: f400, fontColor: primaryColor),
                  ),
                ),
              ),
            ]),
            mqHeight20.ph,
          ]);
        });
  }
}
