

import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../../constant/common_text.dart';
import '../../../constant/font_style.dart';
import '../../../constant/mq_constant.dart';
import '../../../main.dart';
import '../all_product/cart_provider/cart_provider.dart';
import 'widgets/apply_coupon.dart';
import 'widgets/header.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List radioButtonValue = ["Cash on Delivery","Credit & Debit Card","More Payment Options"];

  String groupValues = "Cash on Delivery";
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
            const HeaderOne(),
            mqHeight20.ph,
           const ApplyCoupon(),
            mqHeight20.ph,
            Column(
              children: List.generate(3, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                  margin: EdgeInsets.symmetric(horizontal: mqWidth15,vertical: 8),
                  height: mqHeight40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: groupValues == radioButtonValue[index] ? secondaryColor : whiteColor,
                    borderRadius: BorderRadius.circular(10),
                   
                    boxShadow: const [
                      BoxShadow(color: Color(0xff44a0a933),blurRadius: 6,
                      offset: Offset(3, 3)),
                    ]
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 15,
                        child: Radio(
                          activeColor: primaryColor,
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            return primaryColor;
                          }),
                            value: radioButtonValue[index],
                          groupValue: groupValues,
                          onChanged: (value) {
                              setState(() {
                                groupValues = value!;
                              });
                            },),
                      ),
                      mqWidth15.pw,
                  index == 0 ? const Icon(Icons.wallet) :const  Icon(Icons.payment_outlined),
                      mqWidth15.pw,
                      CommonText(text: radioButtonValue[index], fontSize: fo15, fontWeight: f500, fontColor: blackColor)
                     ,const Spacer(),
                    index == 0 ? const SizedBox() :  Icon(Icons.keyboard_arrow_down_outlined,color: primaryColor,size: 28,)
                    ],
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}


