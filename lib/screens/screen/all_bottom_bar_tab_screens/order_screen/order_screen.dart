import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/order_screen/order_bottom_data.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: CommonText1(text: "Your Order", fontSize: fo20, fontWeight: fBoldFont, fontColor: blackColor),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
        child: Column(
          children: [
            mqHeight5.ph,
            Row(
              children: [
                Flexible(
                    child: Container(
                  height: mq.height * .05,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                    BoxShadow(
                      color: black27Color.withOpacity(.1),
                      blurRadius: 6,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]),
                  child: CommonTextFormField(
                    hintText: "Search for your orders",
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
                      color: black27Color.withOpacity(.1),
                      blurRadius: 6,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    child: Row(
                      children: [
                        CommonText(text: "Recent orders", fontSize: fo12, fontWeight: f400, fontColor: blackColor),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: primaryColor,
                          size: 21,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mq.width * .02,
            ),
            const Expanded(child: OrderBottomData()),
          ],
        ),
      ),
    );
  }
}
