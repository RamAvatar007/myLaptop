import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/select_address_provider/select_address_provider.dart';
import 'package:new_quickly_desige/screens/screen/all_product/product_details_screen/product_details_provider/product_details_provider.dart';
import 'package:provider/provider.dart';
import '../../cart_provider/cart_provider.dart';
import 'product_details_bottom_data_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    scheduleMicrotask(() async{
     await context
          .read<ProductDetailsProvider>()
          .fetchProductDetailsGetApi(widget.productId);
    });
    super.initState();
      Provider.of<ProductDetailsProvider>(context,listen: false)
          .productQuentity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder:
          (BuildContext context, ProductDetailsProvider value, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,

          ///-------------------------------app bar------------------------///
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined)),
            actions: [
              const Icon(Icons.ios_share_outlined),
              mqWidth10.pw,
              const Icon(Icons.bookmark_border_outlined),
              mqWidth15.pw,
            ],
            backgroundColor: whiteColor,
          ),

          ///-------------------------floating action button------------------------///
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: value.isLoading ? const SizedBox() : Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: Container(
              height: mqHeight100,
              width: mq.width,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child:  value
                  .productDetailsModel.data?.isOutOfStock == true ?
             Center( child: Container(
               height: mqHeight40,
               width: mq.width * .35,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                   border: Border.all(
                     width: 1,
                     color: whiteColor,
                   )),
               child: Center(
                   child: CommonText(
                     text: 'Notify Me',
                     fontSize: fo15,
                     fontWeight: f500,
                     fontColor: whiteColor,
                   )),
             ) )
             : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<SelectAddressProvider>(context,
                              listen: false)
                          .fetchAddressListGetApi();

                      await Provider.of<SelectAddressProvider>(context,
                              listen: false)
                          .getSelectedAddress();

                      await Provider.of<CartProvider>(context, listen: false)
                          .fetchAddItemToCartPostApi(
                              productId: widget.productId,
                              qty: value.productQuentity,
                              isBuyNow: false,
                              addressID: Provider.of<SelectAddressProvider>(
                                      context,
                                      listen: false)
                                  .selectedAddress
                                  ?.id);
                    },
                    child: Container(
                      height: mqHeight40,
                      width: mq.width * .35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            width: 1,
                            color: whiteColor,
                          )),
                      child: Center(
                          child: CommonText(
                        text: 'ADD TO CART',
                        fontSize: fo13,
                        fontWeight: f500,
                        fontColor: whiteColor,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      await Provider.of<CartProvider>(context, listen: false)
                          .fetchAddItemToCartPostApi(
                          productId: widget.productId,
                          qty: value.productQuentity,
                          isBuyNow: true,
                          addressID: Provider.of<SelectAddressProvider>(
                              context,
                              listen: false)
                              .selectedAddress
                              ?.id);
                    },
                    child: Container(
                      height: mqHeight40,
                      width: mq.width * .35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: whiteColor,
                      ),
                      child: Center(
                          child: CommonText(
                        text: 'BUY NOW',
                        fontSize: fo13,
                        fontWeight: f500,
                        fontColor: primaryColor,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///------------------------body------------------------///
          body: Consumer<ProductDetailsProvider>(
            builder: (BuildContext context, ProductDetailsProvider value,
                Widget? child) {
              return value.isLoading ?  Container() : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                  child: Column(
                    children: [
                      SizedBox(
                        width: mq.width,
                        height: mq.height * .28,
                        child: PageView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                                imageUrl: value
                                        .productDetailsModel.data?.parentId?.thumbnail
                                        .toString() ??
                                    " ",
                                fit: BoxFit.cover);
                          },
                        ),
                      ),
                      mqHeight15.ph,
                      ProductDetailsBottomDataScreen(value: value),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
