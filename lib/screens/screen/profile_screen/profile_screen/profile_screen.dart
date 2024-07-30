import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/screens/screen/profile_screen/profile_provider/profile_provider.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';
import 'package:provider/provider.dart';
import 'profile_screen_bottom_data.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _image;
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(()async {
      await context.read<ProfileProvider>().fetchProfileGetApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,

        ///-------------------------app bar------------------------///
        appBar: AppBar(
          title: CommonText1(
              text: "Profile",
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

        ///-------------------------floating action button------------------------///
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<ProfileProvider>(
          builder: (context,profileProvider,child) {
            return profileProvider.isLoading?const SizedBox():Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: Container(
                height: mqHeight75,
                width: mq.width,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Center(
                  child: CommonText(
                      text: "UPDATE PROFILE",
                      fontSize: fo20,
                      fontWeight: f400,
                      fontColor: whiteColor),
                ),
              ),
            );
          }
        ),

        ///-------------------------body------------------------///
        body: Consumer<ProfileProvider>(
          builder:
              (BuildContext context, ProfileProvider value, Widget? child) {
            return value.isLoading?loadingIndicator():SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                child: Column(
                  children: [
                    Center(
                      child: Stack(children: [
                        _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                  width: mqWidth120,
                                  height: mqHeight120,
                                  color: secondaryColor,
                                  child: Image.file(
                                    File(_image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                  width: mqWidth120,
                                  height: mqHeight120,
                                  color: secondaryColor,
                                  child: Image.asset(
                                    appleLogoImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                              onTap: () {
                                bottomModelSheet();
                              },
                              child: SvgPicture.asset(editImageLogoImage)),
                        ),
                      ]),
                    ),
                     ProfileScreenBottomData(value: value,),
                  ],
                ),
              ),
            );
          },
        )
    );
  }

  ///-------------------------bottom model sheet------------------------///
  void bottomModelSheet() {
    showModalBottomSheet(
        backgroundColor: primaryColor,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            children: [
              mqHeight10.ph,
              CommonText(
                  text: "Pick Profile Image",
                  fontSize: fo25,
                  fontWeight: f500,
                  fontColor: whiteColor),
              mqHeight10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          shape: const CircleBorder(),
                          fixedSize: Size(mq.width * .3, mq.height * .135)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image.
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            _image = image.path;
                          });
                          log("Image Path: ${image.path} ---- Mime Type: ${image.mimeType}");

                          context
                              .read<ProfileProvider>()
                              .fetchUpLoadImageMultipartApi(
                                  imagePath: File(image.path));
                          toastMessage("Image Uploaded Successfully");
                          toastMessage(image.path);
                          Navigator.pop(context);
                        } else {
                          toastMessage("Image Upload Failed");
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                          width: mq.width * .3,
                          height: mq.height * .1,
                          child: Image.asset(galleryLogoImage))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          shape: const CircleBorder(),
                          fixedSize: Size(mq.width * .3, mq.height * .135)),
                      onPressed: () async {
                        // Capture a photo.
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo =
                            await picker.pickImage(source: ImageSource.camera);
                        if (photo != null) {
                          setState(() {
                            _image = photo.path;
                          });
                          log("Image Path: ${photo.path}");
                          context
                              .read<ProfileProvider>()
                              .fetchUpLoadImageMultipartApi(
                                  imagePath: File(photo.path));
                          toastMessage("Image Uploaded Successfully");
                          Navigator.pop(context);
                        } else {
                          toastMessage("Image Upload Failed");
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                          width: mq.width * .3,
                          height: mq.height * .1,
                          child: Image.asset(cameraLogoImage))),
                ],
              ),
              mqHeight10.ph,
            ],
          );
        });
  }
}
