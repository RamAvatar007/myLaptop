import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/all_product/vendor_list_screen/vendor_list_provider/vendor_list_provider.dart';
import 'package:provider/provider.dart';
import 'vendor_list_bottom_data_screen.dart';

class VendorListScreen extends StatefulWidget {
 final String categoryId;
  const VendorListScreen({super.key, required this.categoryId});

  @override
  State<VendorListScreen> createState() => _VendorListScreenState();
}

class _VendorListScreenState extends State<VendorListScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async{
    await  context.read<VendorListProvider>().vendorListGetApiData(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: whiteColor,
      ////////////-------------------App Bar -------------------////////
      appBar: AppBar(
        title: CommonText1(text: "Vendor Product List", fontSize: fo20, fontWeight: fBoldFont, fontColor: blackColor),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Transform.translate(
                offset: const Offset(0, 5),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: primaryColor,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: secondaryColor, border: Border.all(color: primaryColor, width: 1)),
                  child: Center(
                    child: CommonText(text: "2", fontSize: 8, fontWeight: f500, fontColor: primaryColor),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: mqWidth15,
          )
        ],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: whiteColor,
      ),
      ////////////-------------------body -------------------////////
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mqWidth15,
        ),
        child: Column(
          children: [
            SizedBox(height: mqHeight2),
            Row(
              children: [
                Flexible(
                    child: Container(
                  height: mq.height * .05,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                    BoxShadow(
                      color: black27Color.withOpacity(.2),
                      blurRadius: 6,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]),
                  child: CommonTextFormField(
                    hintText: "Search for your product category",
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: primaryColor,
                    ),
                  ),
                )),
                SizedBox(
                  width: mq.width * .04,
                ),
                Container(
                  height: mq.height * .05,
                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(7), boxShadow: [
                    BoxShadow(
                      color: black27Color.withOpacity(.2),
                      blurRadius: 6,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: primaryColor,
                          size: 21,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            mqHeight15.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "125 Search Results", fontSize: fo15, fontWeight: fBoldFont, fontColor: primaryColor),
                Padding(
                  padding: EdgeInsets.only(right: mqWidth15),
                  child: Icon(
                    Icons.featured_play_list_outlined,
                    color: primaryColor,
                    size: 27,
                  ),
                ),
              ],
            ),
            mqHeight15.ph,
            const Expanded(child: VendorListBottomDataScreen()),
          ],
        ),
      ),
    );
  }
}
