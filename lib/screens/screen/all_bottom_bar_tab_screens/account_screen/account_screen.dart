import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_quickly_desige/constant/common_bg_container2.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/auth_screens/sign_in_screen/view/signin_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/account_screen/account_screen_bottom_data.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
        child: CommonBgContainer2(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: mq.width * .14,
                        height: mq.height * .07,
                        child: Image.asset(
                          logoWhiteImage,
                          fit: BoxFit.fill,
                        )),
                    Column(
                      children: [
                        CommonText1(
                            text: "Account",
                            fontSize: fo20,
                            fontWeight: fBoldFont,
                            fontColor: blackColor),
                        Padding(
                          padding: EdgeInsets.only(
                              top: mq.height * .015, bottom: mq.height * .01),
                          child: SizedBox(
                            height: mq.height * .1,
                            width: mq.width * .2,
                            child: CircleAvatar(
                              backgroundColor: brown98Color,
                              radius: mq.height * .1 / 2.1,
                            ),
                          ),
                        ),
                        CommonText(
                            text: StorageHelper().getUserName(),
                            fontSize: fo15,
                            fontWeight: fBoldFont,
                            fontColor: blackColor),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomModelSheet();
                      },
                      child: Icon(
                        Icons.arrow_circle_right,
                        color: primaryColor,
                        size: 26,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: mq.height * .045,
                ),
                const AccountScreenBottomData(),
              ],
            ),
          ),
        )),
      ),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        builder: (context) {
          return ListView(shrinkWrap: true, children: [
            mqHeight45.ph,
            CommonText1(
                text: "Logout",
                fontSize: fo25,
                fontWeight: fBoldFont,
                fontColor: whiteColor),
            mqHeight10.ph,
            CommonText(
                text: "Are You Sure Want To Log Out?",
                fontSize: fo15,
                fontWeight: f400,
                fontColor: whiteColor),
            mqHeight30.ph,
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
                    child: CommonText(
                        text: "Cancel",
                        fontSize: fo14,
                        fontWeight: f400,
                        fontColor: whiteColor),
                  ),
                ),
              ),
              InkWell(
                onTap: () async{
                  StorageHelper().sp?.clear();
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: Container(
                  width: mq.width * .35,
                  height: mqHeight40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: CommonText(
                        text: "YES, LOGOUT",
                        fontSize: fo14,
                        fontWeight: f400,
                        fontColor: primaryColor),
                  ),
                ),
              ),
            ]),
            mqHeight30.ph,
          ]);
        });
  }
}
