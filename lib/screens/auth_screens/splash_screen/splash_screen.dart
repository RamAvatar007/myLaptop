import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_bg_container.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/auth_screens/welcome_screen/welcome_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/bottom_bar_tabs_screen/bottom_bar_tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (StorageHelper().getUserBearerToken() == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarTabScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: CommonBgContainer(
          child: Column(
        children: [
          SizedBox(height: mq.height * .38),
          Image.asset(logoImage),
          Flexible(child: Container()),
          CommonText(
              text: "V 1.0.0.1",
              fontSize: fo12,
              fontWeight: f400,
              fontColor: brown98Color),
          SizedBox(height: mq.height * .09),
        ],
      )),
    );
  }
}
