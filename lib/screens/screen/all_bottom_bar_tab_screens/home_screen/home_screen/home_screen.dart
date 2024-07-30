import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/common_bg_container2.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_provider/home_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_screen/carousel_slider_home_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_screen/header_home_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_screen/header_home_screen2.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask((){
      context.read<DashBoardProvider>().dashboardGetApiData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///----------body-----------------///
      body: Consumer<DashBoardProvider>(
        builder:
            (BuildContext context, DashBoardProvider value, Widget? child) {
          return value.isLoading
              ?  Center(child: loadingIndicator())
              : SingleChildScrollView(
                  child: CommonBgContainer2(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                      child: SafeArea(
                        child: Column(
                          children: [
                            const HiderHomeScreen(),
                            const HeaderHomeScreen2(),
                            mqHeight20.ph,
                            const CarouselSliderHomeScreen(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
