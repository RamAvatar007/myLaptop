import 'package:flutter/material.dart';
import 'package:new_quickly_desige/screens/auth_screens/sign_in_screen/view/sign_in_bottom_data.dart';
import 'package:new_quickly_desige/screens/auth_screens/sign_in_screen/view_model/sign_in_provider.dart';
import 'package:provider/provider.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_bg_container.dart';
import 'package:new_quickly_desige/constant/common_button.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Consumer<MailSendOtpProvider>(
      builder: (context, value, child) {
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
                        text: "Sign In",
                        fontSize: fo20,
                        fontWeight: fBoldFont,
                        fontColor: blackColor),
                    SizedBox(
                      height: mq.height * .008,
                    ),
                    CommonText(
                        text: "Hi, Welcome back to Quickly app",
                        fontSize: fo15,
                        fontWeight: fBoldFont,
                        fontColor: black27Color),
                    SizedBox(
                      height: mq.height * .008,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonText(
                              text: "Email/Phone",
                              textAlign: TextAlign.left,
                              fontSize: fo15,
                              fontWeight: fBoldFont,
                              fontColor: blackColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mq.height * .008,
                    ),
                    CommonTextFormField(
                        controller: value.emailController,
                        validatorText: "Please Enter Email/Phone",
                        hintText: "example@domain.com"),
                    SizedBox(
                      height: mq.height * .03,
                    ),
                    GestureDetector(
                      onTap: () async {
                        value.mailSendOtpPostApiData(context);
                      },
                      child: const CommonButton(
                        text: 'CONTINUE',
                      ),
                    ),
                    const SignInBottomData()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
