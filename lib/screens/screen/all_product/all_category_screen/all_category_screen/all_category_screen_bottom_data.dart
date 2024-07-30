import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/screens/screen/all_product/all_category_screen/category_list_provider/category_list_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_product/vendor_list_screen/vendor_list_screen/vendor_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListBottomDataScreen extends StatefulWidget {
  const CategoryListBottomDataScreen({super.key});

  @override
  State<CategoryListBottomDataScreen> createState() => _CategoryListBottomDataScreenState();
}

class _CategoryListBottomDataScreenState extends State<CategoryListBottomDataScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryListProvider>().categoryListGetApiData();
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<CategoryListProvider>(
      builder: (context, value, child) {
        return
          GridView.builder(
            shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: mqWidth15, crossAxisSpacing: mqWidth15),
          itemCount: value.categoryListModel.data?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VendorListScreen(
                        categoryId: value.categoryListModel.data?[index].id.toString() ?? " ",
                      ),
                    ));
              },
              child: value.isLoading ?  Shimmer.fromColors(
                baseColor: Colors.white.withOpacity(.5),
                highlightColor: Colors.transparent,
                child: Container(

                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ) : Container(
                decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10), boxShadow: [
                  BoxShadow(
                    color: black27Color.withOpacity(.2),
                    blurRadius: 6,
                    offset: const Offset(3, 3), // changes position of shadow
                  ),
                ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mqHeight80,
                        child: CachedNetworkImage(
                          imageUrl: value.categoryListModel.data?[index].image.toString() ?? " ",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                                // colorFilter: const ColorFilter.mode(
                                //     Colors.red, BlendMode.colorBurn)
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>  Shimmer.fromColors(
                            baseColor: Colors.white.withOpacity(.5),
                            highlightColor: Colors.transparent,
                            child: Container(
                              width: mqWidth45,
                              height: mqHeight45,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(appleLogoImage),
                        ),
                      ),
                      SizedBox(
                        height: mqHeight5,
                      ),
                      Flexible(
                          child: CommonText(
                              text: value.categoryListModel.data?[index].name.toString() ?? "", fontSize: fo12, fontWeight: fBoldFont, fontColor: blackColor)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
