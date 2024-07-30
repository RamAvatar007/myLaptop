import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

class HiderHomeScreen extends StatefulWidget {
  const HiderHomeScreen({super.key});

  @override
  State<HiderHomeScreen> createState() => _HiderHomeScreenState();
}

class _HiderHomeScreenState extends State<HiderHomeScreen> {
  final CarouselController controllerController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (BuildContext context, DashBoardProvider value, Widget? child) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: mqWidth45,
                  height: mqHeight45,
                  child: Image.asset(
                    logoWhiteImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(child: Container()),
                CommonText(
                  text: 'Add Your Vehicle',
                  fontSize: fo12,
                  fontWeight: f400,
                  fontColor: brown9fColor,
                ),
                mqWidth5.pw,
                Container(
                    width: mqWidth40,
                    height: mqHeight40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Icon(
                      Icons.car_rental_outlined,
                      color: primaryColor,
                    )),
              ],
            ),
            mqHeight10.ph,
            Container(
              height: mqHeight45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: primaryColor,
                    offset: const Offset(6, 6),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: CommonTextFormField(
                hintText: "Search for genuine spare parts",
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: primaryColor,
                ),
              ),
            ),
            mqHeight20.ph,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CarouselSlider(
                  items: value.dashboardModel.data?.banner
                          ?.map((e) => Container(
                                width: mq.width,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: value.dashboardModel.data
                                          ?.banner?[currentIndex].image
                                          .toString() ??
                                      "",
                                  placeholder: (context, url) =>
                                      const SizedBox(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ))
                          .toList() ??
                      [],
                  options: CarouselOptions(
                    height: mqHeight180,
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    // aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
            ),
            mqHeight20.ph,
          ],
        );
      },
    );
  }
}
