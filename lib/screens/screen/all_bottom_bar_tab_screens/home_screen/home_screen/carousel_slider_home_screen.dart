import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_rich_text.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

class CarouselSliderHomeScreen extends StatefulWidget {
  const CarouselSliderHomeScreen({super.key});

  @override
  State<CarouselSliderHomeScreen> createState() =>
      _CarouselSliderHomeScreenState();
}

class _CarouselSliderHomeScreenState extends State<CarouselSliderHomeScreen> {
  List imageList = [
    {"id": 1, "image_path": "assets/images/car1.jpg"},
    {"id": 2, "image_path": "assets/images/car2.jpg"},
    {"id": 3, "image_path": "assets/images/car3.jpg"},
    {"id": 4, "image_path": "assets/images/car4.jpeg"},
    {"id": 5, "image_path": "assets/images/car5.png"}
  ];
  final CarouselController controllerController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (BuildContext context, DashBoardProvider value, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
                text: "NEW IN STOCK",
                fontSize: fo15,
                fontWeight: f500,
                fontColor: blackColor),
            mqHeight10.ph,
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CarouselSlider(
                        items: imageList
                            .map((e) => Image.asset(
                                  e['image_path'],
                                  fit: BoxFit.cover,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          viewportFraction: 1.0,
                          aspectRatio: 16 / 9,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          initialPage: 0,
                        )),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 39,
                    height: 39,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(
                                3, 3), // changes position of shadow
                          ),
                        ]),
                    child: Center(
                      child: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            mqHeight20.ph,
            CommonText(
                text: "TOP SELLING",
                fontSize: fo15,
                fontWeight: f500,
                fontColor: blackColor),
            mqHeight10.ph,
            GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: mqWidth5,
                mainAxisSpacing: mqHeight5,
                mainAxisExtent: 210,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(mqHeight5),
                      margin: EdgeInsets.all(mqHeight5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: black27Color.withOpacity(.2),
                            blurRadius: 6,
                            offset: const Offset(
                                3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: mqHeight80,
                              width: mqWidth90,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://www.hlsmith.co.uk/wp-content/uploads/Mercedes-Gearbox-980x653.png",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                      // colorFilter: const ColorFilter.mode(
                                      //     Colors.red, BlendMode.colorBurn)
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => SpinKitCircle(
                                  color: primaryColor,
                                  size: 50.0,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(appleLogoImage),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mqHeight10,
                          ),
                          Flexible(
                              child: CommonText1(
                                  text: "Break",
                                  fontSize: fo12,
                                  fontWeight: fBoldFont,
                                  fontColor: blackColor)),
                          mqHeight5.ph,
                          Flexible(
                              child: CommonText1(
                                  text: "Toyota, Land Cruiser",
                                  fontSize: fo10,
                                  fontWeight: f400,
                                  fontColor: black57Color)),
                          mqHeight5.ph,
                          Flexible(
                              child: CommonText1(
                                  text: "OMR 1,512",
                                  fontSize: fo12,
                                  fontWeight: f400,
                                  fontColor: primaryColor)),
                          mqHeight5.ph,
                          CommonRichText(
                              text1: "5000",
                              text2: "50%",
                              fontSize1: fo10,
                              fontSize2: fo10,
                              color1: black27Color,
                              color2: green2cColor)
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: mqWidth30,
                        height: mqHeight30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: primaryColor),
                        child: Center(
                          child: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            mqHeight20.ph,
          ],
        );
      },
    );
  }
}
