import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../../constant/common_text.dart';
import '../../../constant/font_style.dart';
import '../../../constant/mq_constant.dart';
import '../../../main.dart';
import '../address_screen/manage_address/select_address_screen/widgets/header_screen.dart';
import '../all_product/cart_provider/cart_provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: CommonText1(
          text: 'Select Address',
          fontSize: fo20,
          fontWeight: fBoldFont,
          fontColor: blackColor,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      backgroundColor: whiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider value, Widget? child) {
          if (value.cartListModel.data == null) {
            return const SizedBox();
          } else {
            return value.isLoading
                ? const SizedBox()
                : Container(
                    height: mqHeight120,
                    width: mq.width,
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .065),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: mq.height * .022,
                        ),
                        CommonText(text: "Total Price For ${Provider.of<CartProvider>(context, listen: false).cartListModel.data?.items?.length ?? 0} Item(s)", fontSize: fo15, fontWeight: f600, fontColor: whiteColor),
                        SizedBox(
                          height: mq.height * .012,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentMethodScreen(),
                                ));
                          },
                          child: Container(
                            width: mq.width * .7,
                            height: mq.height * .05,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: whiteColor),
                            child: Center(
                              child: CommonText(text: "SLIDE TO PAY OMR 99,000 >>>", fontSize: fo14, fontWeight: f500, fontColor: primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mq.height * .012,
                        ),
                        CommonText(text: "Wow! You Saved OMR 241", fontSize: fo12, fontWeight: f500, fontColor: whiteColor),
                        SizedBox(
                          height: mq.height * .0012,
                        ),
                      ],
                    ),
                  );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          const  Header(),
            mqHeight20.ph,
            Container(
              width: double.infinity,
              height: 160,
              color: secondaryColor,
              padding: EdgeInsets.symmetric(horizontal: mqWidth15,vertical: mqHeight20),
              child: Column(
                children: [
                  CommonText(text: "Apply Coupon", fontSize: fo15, fontWeight: f600, fontColor: blackColor),
                  mqWidth5.ph,
                  Row(
                    children: [

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


