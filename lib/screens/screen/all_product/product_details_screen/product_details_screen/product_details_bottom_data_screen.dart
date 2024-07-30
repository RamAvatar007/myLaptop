import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_rich_text_league_spartan.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/screens/screen/all_product/product_details_screen/product_details_provider/product_details_provider.dart';

class ProductDetailsBottomDataScreen extends StatelessWidget {
  const ProductDetailsBottomDataScreen({super.key, required this.value});
  final ProductDetailsProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: CommonText1(
                    text: value.productDetailsModel.data?.parentId?.name
                            .toString() ??
                        " ",
                    fontSize: fo25,
                    fontWeight: f600,
                    fontColor: blackColor)),
            CommonText(
                text: "(7,45,86)",
                fontSize: fo15,
                fontWeight: f400,
                fontColor: brown9fColor)
          ],
        ),
        mqHeight5.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
                text: value.productDetailsModel.data?.parentId?.brandId?.name
                        .toString() ??
                    " ",
                fontSize: fo12,
                fontWeight: f400,
                fontColor: black57Color),
            CommonText(
                text: "Quantity",
                fontSize: fo12,
                fontWeight: f400,
                fontColor: black57Color),
          ],
        ),
        mqHeight15.ph,
        Row(
          children: [
            Row(
              children: [
                CommonText(
                    text:
                        "OMR ${value.productDetailsModel.data?.vendorPrice ?? 0}",
                    fontSize: fo20,
                    fontWeight: f400,
                    fontColor: primaryColor),
                mqWidth10.pw,
                CommonRichTextLeagueSpartan(
                    text1:
                        "(${value.productDetailsModel.data?.parentId?.yearModelStart.toString().toString() ?? " "}",
                    text2:
                        "-${value.productDetailsModel.data?.parentId?.yearModelEnd.toString() ?? " "})",
                    fontSize: fo13,
                    color1: brown9fColor,
                    color2: brown9fColor)
              ],
            ),
            Flexible(child: Container()),
            value.productDetailsModel.data?.isOutOfStock == true
                ? CommonText(
                    text: "Out Of Stock",
                    fontSize: fo15,
                    fontWeight: fBoldFont,
                    fontColor: blackColor)
                : SizedBox(
                    width: mqWidth85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondaryColor.withOpacity(.5),
                            ),
                            child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    value.decrement();
                                  },
                                  child: CommonText(
                                      text: "-",
                                      fontSize: fo25,
                                      fontWeight: f600,
                                      fontColor: black27Color)),
                            ),
                          ),
                        ),
                        CommonText(
                            text: value.productQuentity.toString(),
                            fontSize: fo12,
                            fontWeight: f500,
                            fontColor: primaryColor),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondaryColor,
                            ),
                            child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    value.increment();
                                  },
                                  child: CommonText(
                                      text: "+",
                                      fontSize: fo25,
                                      fontWeight: f600,
                                      fontColor: blackColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
        mqHeight15.ph,
        CommonText(
            text: "Details",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        mqHeight2.ph,
        CommonText(
            text:
                "Product Name : ${value.productDetailsModel.data?.vendorId?.name.toString() ?? " "}",
            fontSize: fo12,
            fontWeight: f400,
            fontColor: black57Color),
        mqHeight5.ph,
        CommonText(
            text:
                "Vendor Serial : ${value.productDetailsModel.data?.parentId?.serialNumber.toString() ?? " "}",
            fontSize: fo12,
            fontWeight: f400,
            fontColor: black57Color),
        mqHeight15.ph,
        CommonText(
            text: "Description",
            fontSize: fo15,
            fontWeight: f500,
            fontColor: blackColor),
        mqHeight2.ph,
        CommonText(
          text: value.productDetailsModel.data?.parentId?.description
                  .toString() ??
              " ",
          fontSize: fo13,
          fontWeight: f400,
          fontColor: black57Color,
          textAlign: TextAlign.left,
        ),
        mqHeight100.ph,
      ],
    );
  }
}
