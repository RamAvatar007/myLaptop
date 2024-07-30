import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/Common_text_field.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/screens/screen/profile_screen/profile_provider/profile_provider.dart';

class ProfileScreenBottomData extends StatelessWidget {
  const ProfileScreenBottomData({super.key, required this.value});
  final ProfileProvider value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mqHeight10,
        ),
        CommonText(
            text: "Name",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        CommonTextFormField1(
          initialValue: value.profileModel.data?.name.toString() ?? "",
          hintText: "     Johan",
        ),
        SizedBox(height: mqHeight15),
        CommonText(
            text: "Phone Number",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        CommonTextFormField1(
          initialValue: value.profileModel.data?.mobileNumber.toString() ?? "",
          hintText: "     +91 9587963021",
          suffixText: "Change",
        ),
        SizedBox(height: mqHeight15),
        CommonText(
            text: "Email",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        CommonTextFormField1(
          initialValue: value.profileModel.data?.email.toString() ?? "",
          hintText: "     example@gmail.com",
          suffixText: "Change",
        ),
        SizedBox(height: mqHeight15),
        CommonText(
            text: "Current Password",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        CommonTextFormField1(
          initialValue: value.profileModel.data?.password.toString() ?? "",
          hintText: "     *************",
          obscureText: true,
        ),
        SizedBox(height: mqHeight15),
        Align(
            alignment: Alignment.topRight,
            child: CommonText(
              text: "Forgot Password?",
              fontSize: fo12,
              fontWeight: f400,
              fontColor: primaryColor,
              decoration: TextDecoration.underline,
            )),
        SizedBox(height: mqHeight10),
        CommonText(
            text: "Current Password",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        const CommonTextFormField1(
          hintText: "     Yalu@bsh",
          suffixText: "Change",
        ),
        SizedBox(height: mqHeight15),
        CommonText(
            text: "New Password",
            fontSize: fo15,
            fontWeight: f400,
            fontColor: blackColor),
        SizedBox(
          height: mqHeight5,
        ),
        const CommonTextFormField1(
          hintText: "     *************",
          obscureText: true,
        ),
      ],
    );
  }
}
