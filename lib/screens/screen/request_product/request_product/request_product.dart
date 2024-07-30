import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_quickly_desige/constant/Common_text_field.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_button.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';

class RequestProduct extends StatefulWidget {
  const RequestProduct({super.key});

  @override
  State<RequestProduct> createState() => _RequestProductState();
}

class _RequestProductState extends State<RequestProduct> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: whiteColor,

      ///--------- -----------app bar--------------------------///
      appBar: AppBar(
        title: CommonText1(
            text: "Request Product",
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

      ///--------- -----------floating action button--------------------------///
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CommonButton(
        text: 'SUBMIT REQUEST',
      ),

      ///--------- -----------body--------------------------///
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqWidth15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mqHeight10.ph,
              CommonText(
                  text: "Car Model",
                  fontSize: fo15,
                  fontWeight: f500,
                  fontColor: blackColor),
              SizedBox(
                height: mqHeight10,
              ),
              const CommonTextFormField1(
                // initialValue: StorageHelper().getUserName(),
                hintText: "Ex. Land Cruiser",
              ),
              mqHeight15.ph,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: "Car Brand",
                            fontSize: fo15,
                            fontWeight: f500,
                            fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        const CommonTextFormField1(
                          // initialValue: StorageHelper().getUserName(),
                          hintText: "Ex. Toyota",
                        ),
                      ],
                    ),
                  ),
                  mqWidth20.pw,
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: "Year",
                            fontSize: fo15,
                            fontWeight: f500,
                            fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        const CommonTextFormField1(
                          // initialValue: StorageHelper().getUserName(),
                          hintText: "Ex. 2023",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              mqHeight15.ph,
              CommonText(
                  text: "Product Name",
                  fontSize: fo15,
                  fontWeight: f500,
                  fontColor: blackColor),
              SizedBox(
                height: mqHeight10,
              ),
              const CommonTextFormField1(
                // initialValue: StorageHelper().getUserName(),
                hintText: "Ex. Head Lamp",
              ),
              mqHeight15.ph,
              CommonText(
                  text: "Message",
                  fontSize: fo15,
                  fontWeight: f500,
                  fontColor: blackColor),
              SizedBox(
                height: mqHeight10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: mqWidth10),
                height: mqWidth120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.2),
                        offset: const Offset(3, 3),
                        blurRadius: 6.0,
                      ),
                    ]),
                child: TextFormField(
                  maxLines: 15,
                  cursorColor: primaryColor,
                  style: GoogleFonts.leagueSpartan(
                      fontSize: fo15, color: blackColor, fontWeight: f400),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add note on your request",
                  ),
                ),
              ),
              mqHeight15.ph,
              Center(
                child: Column(
                  children: [
                    CommonText(
                      text: 'Add Media',
                      fontSize: fo15,
                      fontWeight: f400,
                      fontColor: blackColor,
                    ),
                    mqHeight10.ph,
                    Container(
                      width: mqWidth100,
                      height: mqHeight100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor, width: 1),
                      ),
                      child: Center(
                        child: Image.asset(logoImage),
                      ),
                    ),
                    mqHeight10.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        reusableContainer(
                            myWidget: const Icon(Icons.camera_alt_outlined),
                            text: "Take Photo"),
                        reusableContainer(
                            myWidget: const Icon(Icons.photo_outlined),
                            text: "Image From Gallery"),
                        reusableContainer(
                            myWidget: const Icon(Icons.mic_none_outlined),
                            text: "Record Audio"),
                      ],
                    ),
                    mqHeight10.ph,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableContainer({required Widget myWidget, String? text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: mqWidth45,
          height: mqHeight45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: secondaryColor),
          child: Center(child: myWidget),
        ),
        mqHeight10.ph,
        CommonText(
            text: text ?? "",
            fontSize: fo12,
            fontWeight: f400,
            fontColor: blackColor),
      ],
    );
  }
}
