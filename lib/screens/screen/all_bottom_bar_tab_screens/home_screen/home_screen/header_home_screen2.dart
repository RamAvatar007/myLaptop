import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_rich_text.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/home_screen/home_provider/home_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_product/all_category_screen/all_category_screen/all_category_screen.dart';
import 'package:provider/provider.dart';

class HeaderHomeScreen2 extends StatefulWidget {
  const HeaderHomeScreen2({super.key});

  @override
  State<HeaderHomeScreen2> createState() => _HeaderHomeScreen2State();
}

class _HeaderHomeScreen2State extends State<HeaderHomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (BuildContext context, DashBoardProvider value, Widget? child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "SHOP BY POPULAR BRANDS", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                CommonRichText(text1: "See all", text2: " >", fontSize1: fo12, fontSize2: fo12, color1: primaryColor, color2: primaryColor),
              ],
            ),
            mqHeight10.ph,
            SizedBox(
              height: mqHeight120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: value.dashboardModel.data?.banner?.length ?? 0,
                separatorBuilder: (context, index) {
                  return mqWidth10.pw;
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: mqWidth100,
                    height: mqHeight120,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(.4),
                          blurRadius: 6,
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: mqWidth60,
                            height: mqHeight60,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: value.dashboardModel.data?.brand?[index].image.toString() ?? " ",
                              placeholder: (context, url) => const SizedBox(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          mqHeight10.ph,
                          CommonText(text: value.dashboardModel.data?.brand?[index].name.toString() ?? "", fontSize: fo15, fontWeight: f600, fontColor: blackColor),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            mqHeight20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "SHOP BY POPULAR CARS", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryListScreen()));
                  },
                  child: CommonRichText(text1: "See all", text2: " >", fontSize1: fo12, fontSize2: fo12, color1: primaryColor, color2: primaryColor),
                ),
              ],
            ),
            mqHeight10.ph,
            SizedBox(
              height: mqHeight120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: value.dashboardModel.data?.category?.length ?? 0,
                separatorBuilder: (context, index) {
                  return mqWidth10.pw;
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: mqWidth100,
                    height: mqHeight120,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(.4),
                          blurRadius: 6,
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: mqWidth60,
                            height: mqHeight60,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: value.dashboardModel.data?.category?[index].image.toString() ?? " ",
                              placeholder: (context, url) => const SizedBox(),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: primaryColor,
                                size: 21,
                              ),
                            ),
                          ),
                          mqHeight10.ph,
                          CommonText(text: value.dashboardModel.data?.category?[index].name.toString() ?? "", fontSize: fo15, fontWeight: f600, fontColor: blackColor),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
