import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/address_screen/address_screen/address_screen.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/select_address_provider/select_address_provider.dart';
import 'package:new_quickly_desige/screens/screen/payment_method/payment_method_screen.dart';
import 'package:provider/provider.dart';

import '../../../all_product/cart_provider/cart_provider.dart';
import 'widgets/header_screen.dart';
import 'widgets/list_view_data.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async{
    await  context.read<SelectAddressProvider>().fetchAddressListGetApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectAddressProvider>(
      builder: (BuildContext context, SelectAddressProvider value, Widget? child) {
        return   value.isLoading ? loadingIndicator() : Scaffold(

            ///----------app bar ----------///
            appBar: AppBar(
              backgroundColor: whiteColor,
              centerTitle: true,
              title: CommonText1(
                text: 'Select Address',
                fontSize: fo20,
                fontWeight: fBoldFont,
                fontColor: blackColor,
              ),
              actions: [
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddressScreen(),));

                    },
                    child: Icon(CupertinoIcons.plus_circle_fill,color: primaryColor,size: 19,)),
                SizedBox(width: mqWidth15,)
              ],
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider value, Widget? child) {
                if(value.cartListModel.data == null){
                  return const SizedBox();
                }else{
                  return value.isLoading ? const SizedBox():Container(
                    height: mqHeight100,
                    width: mq.width,
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .065),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                       ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Total Price For ${Provider.of<CartProvider>(context,listen: false).cartListModel.data?.items?.length ?? 0} Item(s)",
                                fontSize: fo15,
                                fontWeight: f600,
                                fontColor: whiteColor),
                            SizedBox(
                              height: mq.height * .0012,
                            ),
                            CommonText(
                                text: "OMR ₹ ${value.totalPrice.toStringAsFixed(2)}",
                                fontSize: fo20,
                                fontWeight: fBoldFont,
                                fontColor: whiteColor),
                          ],
                        ),
                        Flexible(child: Container()),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const PaymentMethodScreen(),));
                          },
                          child: Container(
                            width: mq.width * .4,
                            height: mq.height * .05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: whiteColor),
                            child: Center(
                              child: CommonText(
                                  text: "MAKE PAYMENT",
                                  fontSize: fo14,
                                  fontWeight: f500,
                                  fontColor: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },

            ),
            backgroundColor: whiteColor,

            ///----------body----------///
            body: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: mqHeight10, horizontal: mqWidth15),
                  child: Column(
                    children: [
                     const Header(),
                      mqHeight20.ph,
                      ListViewData(value: value),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

