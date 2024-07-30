import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/select_address_screen/select_address_screen.dart';
import 'package:new_quickly_desige/screens/screen/all_product/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'list_view_separated.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      await context.read<CartProvider>().fetchCartListGetAPi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: CommonText1(text: "Cart", fontSize: fo20, fontWeight: f600, fontColor: blackColor),
        centerTitle: true,
        actions: [
          const InkWell(child: Icon(Icons.edit_outlined)),
          SizedBox(
            width: mq.width * .04,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider value, Widget? child) {
          if (value.cartListModel.data == null) {
            return const SizedBox();
          } else {
            return value.isLoading
                ? const SizedBox()
                : Container(
                    height: mq.height * .09,
                    width: mq.width,
                    margin: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .025),
                    decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(text: "Total Price For ${Provider.of<CartProvider>(context, listen: false).cartListModel.data?.items?.length ?? 0} Item(s)", fontSize: fo15, fontWeight: f600, fontColor: blackColor),
                            SizedBox(
                              height: mq.height * .0012,
                            ),
                            CommonText(text: "OMR ₹ ${value.totalPrice.toStringAsFixed(2)}", fontSize: fo20, fontWeight: fBoldFont, fontColor: primaryColor),
                          ],
                        ),
                        Flexible(child: Container()),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SelectAddressScreen(),
                                ));
                          },
                          child: Container(
                            width: mq.width * .4,
                            height: mq.height * .05,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: primaryColor),
                            child: Center(
                              child: CommonText(text: "PROCEED TO BUY", fontSize: fo14, fontWeight: f400, fontColor: whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }
        },
      ),
      body: const ListViewSeparated(),
    );
  }
}
