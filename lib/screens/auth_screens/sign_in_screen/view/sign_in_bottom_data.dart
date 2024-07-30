import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_rich_text_league_spartan.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/helper/show_progressbar.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/bottom_bar_tabs_screen/bottom_bar_tab_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_screen/home_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class SignInBottomData extends StatefulWidget {
  const SignInBottomData({super.key});

  @override
  State<SignInBottomData> createState() => _SignInBottomDataState();
}

class _SignInBottomDataState extends State<SignInBottomData> {
  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        log("\n User : ${user.user}");
        log("\n UserAdditionalInfo : ${user.additionalUserInfo}");
        log("\ncredential:  ${user.credential}");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBarTabScreen(),
            ));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('\n _signInWithGoogle: $e');
      toastMessage("Somethings Went Wrong (Check Internet)");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mq.height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: mq.width * .15,
              height: 1,
              color: brown9fColor,
            ),
            CommonText(
                text: "Or sign In with",
                fontSize: fo12,
                fontWeight: f400,
                fontColor: brown9fColor),
            Container(
              width: mq.width * .15,
              height: 1,
              color: brown9fColor,
            ),
          ],
        ),
        SizedBox(
          height: mq.height * .05,
        ),
        GestureDetector(
          onTap: () {
            bottomModelSheet();
          },
          child: Container(
            height: mq.height * .2,
            margin: EdgeInsets.symmetric(horizontal: mq.width * .17),
            padding: EdgeInsets.symmetric(horizontal: mq.width * .025),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9), color: whiteColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 66,
                    width: 66,
                    child: Image.asset(
                      faceIdImage,
                      color: primaryColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .01,
                  ),
                  CommonRichTextLeagueSpartan(
                    text1: "Sign In with ",
                    text2: "Face ID",
                    fontSize: fo15,
                    color1: blackColor,
                    color2: primaryColor,
                    fontWeight: f500,
                    onTap: TapGestureRecognizer()..onTap = () {},
                  ),
                  SizedBox(
                    height: mq.height * .01,
                  ),
                  CommonText(
                      text: 'Look directly at your front camera to use Face ID',
                      fontSize: fo12,
                      fontWeight: f400,
                      fontColor: brown9fColor),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: mq.height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _handleGoogleBtnClick();
              },
              child: Container(
                width: 51,
                height: 51,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(color: primaryColor, width: 1)),
                child: Center(
                  child: SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        googleLogoImage,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: mq.width * .03,
            ),
            Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(27),
                  border: Border.all(color: primaryColor, width: 1)),
              child: Center(
                child: SizedBox(
                    width: 22,
                    height: 22,
                    child: Image.asset(
                      appleLogoImage,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: mq.height * .02,
        ),
        CommonRichTextLeagueSpartan(
          text1: "Don't Have An Account?",
          text2: "  Sign Up",
          fontSize: fo12,
          fontWeight: f400,
          color1: black57Color,
          color2: primaryColor,
          onTap: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ));
            },
        ),
        SizedBox(
          height: mq.height * .022,
        ),
        InkWell(
            child: CommonText(
                text: "Continue as Guest",
                fontSize: fo12,
                fontWeight: f400,
                fontColor: brown9fColor))
      ],
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
            mqHeight25.ph,
            CommonText1(
                text: "Enable Face ID",
                fontSize: fo25,
                fontWeight: fBoldFont,
                fontColor: whiteColor),
            mqHeight10.ph,
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                faceIdImage, color: whiteColor,
                //fit: BoxFit.fill,
              ),
            ),
            mqHeight10.ph,
            CommonText(
                text:
                    "Enabling Face ID Will Give You Faster Access To Your App. You Can Turn This Feature On Or Off Any Time In Settings.",
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
                    child: CommonText(
                        text: "NOT NOW",
                        fontSize: fo14,
                        fontWeight: f400,
                        fontColor: whiteColor),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: mq.width * .35,
                  height: mqHeight40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Center(
                    child: CommonText(
                        text: "ENABLE",
                        fontSize: fo14,
                        fontWeight: f400,
                        fontColor: primaryColor),
                  ),
                ),
              ),
            ]),
            mqHeight10.ph,
            CommonText(
                text: "Learn More About Face ID",
                fontSize: fo15,
                fontWeight: f400,
                decoration: TextDecoration.underline,
                fontColor: whiteColor),
            mqHeight20.ph,
          ]);
        });
  }
}
