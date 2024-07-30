import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_bg_container.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_button.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';

class VerifyAndResetPasswordScreen extends StatefulWidget {
  const VerifyAndResetPasswordScreen({super.key});

  @override
  State<VerifyAndResetPasswordScreen> createState() =>
      _VerifyAndResetPasswordScreenState();
}

class _VerifyAndResetPasswordScreenState
    extends State<VerifyAndResetPasswordScreen> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: SingleChildScrollView(
      child: CommonBgContainer(
        child: Padding(
          padding: EdgeInsets.only(
              left: mq.width * .04,
              right: mq.width * .04,
              top: mq.height * .07),
          child: Column(
            children: [
              SizedBox(
                  width: 55,
                  height: 55,
                  child: Image.asset(
                    logoWhiteImage,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: mq.height * .03,
              ),
              CommonText1(
                  text: "Verify And Reset Password",
                  fontSize: fo20,
                  fontWeight: fBoldFont,
                  fontColor: blackColor),
              SizedBox(
                height: mqHeight20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                      text: "+91 9884636352",
                      fontSize: fo15,
                      fontWeight: fBoldFont,
                      fontColor: blackColor),
                  InkWell(
                    child: Icon(
                      Icons.edit_outlined,
                      color: blackColor,
                      size: 17,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mq.height * .01,
              ),
              CommonText(
                  text:
                      "We've sent a One Time Password to the mobile number above. Please enter it to complete verification",
                  fontSize: fo12,
                  fontWeight: f500,
                  fontColor: black27Color),
              SizedBox(
                height: mqHeight15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CommonText(
                    text: "Enter Otp",
                    textAlign: TextAlign.left,
                    fontSize: fo15,
                    fontWeight: f500,
                    fontColor: blackColor),
              ),
              SizedBox(
                height: mqHeight10,
              ),
              const CommonTextFormField(
                hintText: "Ex. 456895",
              ),
              SizedBox(
                height: mqHeight15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CommonText(
                    text: "New Password",
                    textAlign: TextAlign.left,
                    fontSize: fo15,
                    fontWeight: f500,
                    fontColor: blackColor),
              ),
              SizedBox(
                height: mqHeight10,
              ),
              const CommonTextFormField(
                hintText: "Adf4521SfGhu&01",
              ),
              SizedBox(
                height: mqHeight15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CommonText(
                    text: "Confirm New Password",
                    textAlign: TextAlign.left,
                    fontSize: fo15,
                    fontWeight: f500,
                    fontColor: blackColor),
              ),
              SizedBox(
                height: mqHeight10,
              ),
              CommonTextFormField(
                obscureText: isVisible,
                hintText: "*****************",
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: brown9fColor,
                    )),
              ),
              SizedBox(
                height: mqHeight25,
              ),
              GestureDetector(
                onTap: () {},
                child: const CommonButton(
                  text: 'RESET PASSWORD',
                ),
              ),
              SizedBox(
                height: mq.height * .025,
              ),
              SizedBox(
                width: mq.width * .8,
                child: CommonText(
                  text: "Resend OTP",
                  fontSize: fo12,
                  fontWeight: f400,
                  fontColor: primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
