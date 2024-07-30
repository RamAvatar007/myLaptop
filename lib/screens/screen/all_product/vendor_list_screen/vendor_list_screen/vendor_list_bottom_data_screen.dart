import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/app_image.dart';
import 'package:new_quickly_desige/constant/common_rich_text_league_spartan.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/screens/screen/all_product/product_details_screen/product_details_screen/product_details_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_product/vendor_list_screen/vendor_list_provider/vendor_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class VendorListBottomDataScreen extends StatefulWidget {
  const VendorListBottomDataScreen({super.key});

  @override
  State<VendorListBottomDataScreen> createState() => _VendorListBottomDataScreenState();
}

class _VendorListBottomDataScreenState extends State<VendorListBottomDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorListProvider>(
      builder: (context, value, child) {
        return value.isLoading ? Container() : GridView.builder(
          itemCount: value.vendorListModel.data?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: mqWidth5,
            mainAxisSpacing: mqHeight5,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        productId: value.vendorListModel.data?[index].id.toString() ?? '',
                      ),
                    ));
              },
              child: Stack(
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
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: mqHeight80,
                            width: mqWidth90,
                            child: CachedNetworkImage(
                              imageUrl: value.vendorListModel.data![index]?.parentId?.thumbnail??"",
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: blackColor,
                                      child: SizedBox(
                                          height: mqHeight80,
                                          width: mqWidth90,),
                              ),
                              errorWidget: (context, url, error) => Image.asset(appleLogoImage),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mqHeight5,
                        ),
                        CommonText1(
                          textAlign: TextAlign.left,
                            maxLine: 2,
                            text: value.vendorListModel.data?[index].parentId?.name.toString() ?? "",
                            fontSize: fo12,
                            fontWeight: fBoldFont,
                            fontColor: blackColor),
                        mqHeight2.ph,
                        CommonText1(
                            text: value.vendorListModel.data?[index].parentId?.brandId?.name.toString() ?? "",
                            fontSize: fo12,
                            fontWeight: f400,
                            fontColor: black57Color),
                        mqHeight5.ph,
                        CommonRichTextLeagueSpartan(
                          text1: "OMR",
                          text2: "  ${value.vendorListModel.data?[index].vendorPrice.toString() ?? 0}",
                          color1: green2cColor,
                          color2: green2cColor,
                          fontSize: fo12,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: mqWidth30,
                      height: mqHeight30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: primaryColor),
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
              ),
            );
          },
        );
      },
    );
  }
}
