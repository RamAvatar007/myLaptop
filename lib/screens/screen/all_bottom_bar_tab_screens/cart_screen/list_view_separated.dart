import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/all_product/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ListViewSeparated extends StatefulWidget {
  const ListViewSeparated({
    super.key,
  });

  @override
  State<ListViewSeparated> createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        if (value.cartListModel.data == null) {
          if (value.isLoading) {
            return const SizedBox();
          } else {
            return const Center(
              child: Text(
                "Cart is empty",
                style: TextStyle(fontSize: 21),
              ),
            );
          }
        }
        return value.isLoading
            ? Container()
            : ListView.separated(
                separatorBuilder: (context, index) {
                  return mqHeight10.ph;
                },
                itemCount: value.cartListModel.data?.items?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    child: Container(
                      width: mq.width,
                      height: mq.height * .175,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(.1),
                          blurRadius: 6,
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ]),
                      child: Padding(
                        padding: EdgeInsets.only(left: mq.width * .02, right: mqWidth10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: mq.width * .2,
                              height: mq.height * .1,
                              child: CachedNetworkImage(
                                imageUrl: value.cartListModel.data?.items?[index].productId?.productId?.thumbnail.toString() ?? " ",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: mq.width * .02,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: mq.width * .65,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: mq.width * .44,
                                            child: CommonText1(text: value.cartListModel.data?.items?[index].productId?.productId?.name.toString() ?? " ", maxLine: 1, fontSize: fo13, fontWeight: fBoldFont, fontColor: blackColor),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          CommonText(text: value.cartListModel.data?.items?[index].productId?.productId?.brandId?.name.toString() ?? " ", fontSize: fo12, fontWeight: f400, fontColor: black57Color),
                                          SizedBox(
                                            height: mq.width * .01,
                                          ),
                                          CommonText(text: "Quantity : ${value.cartListModel.data?.items?[index].qty ?? 0}", fontSize: fo12, fontWeight: f500, fontColor: blackColor),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 78,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    value.fetchUpdateQuanitityPutApi(value.cartListModel.data?.items?[index].id ?? "", int.parse(value.cartListModel.data?.items?[index].qty.toString() ?? "0") - 1, index);

                                                    // value.updateCartItemQty(index, false);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: secondaryColor.withOpacity(.5),
                                                    ),
                                                    child: Center(
                                                      child: CommonText(text: "-", fontSize: fo20, fontWeight: f600, fontColor: black27Color),
                                                    ),
                                                  ),
                                                ),
                                                CommonText(text: value.getCounterQty(index).toString(), fontSize: fo12, fontWeight: f500, fontColor: primaryColor),
                                                InkWell(
                                                  onTap: () {
                                                    // value.updateCartItemQty(index,true);
                                                    value.fetchUpdateQuanitityPutApi(value.cartListModel.data?.items?[index].id ?? "", int.parse(value.cartListModel.data?.items?[index].qty.toString() ?? "0") + 1, index);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: secondaryColor,
                                                    ),
                                                    child: Center(
                                                      child: CommonText(text: "+", fontSize: fo20, fontWeight: f600, fontColor: blackColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: mq.height * .005,
                                          ),
                                          CommonText(text: "OMR ₹ ${value.cartListModel.data?.items?[index].productId?.productId?.price.toString() ?? " "}", fontSize: fo15, fontWeight: f500, fontColor: primaryColor),
                                          SizedBox(
                                            height: mq.height * .011,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: mq.height * .007,
                                ),
                                SizedBox(
                                  width: mq.width * .65,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: mq.height * .035,
                                        width: mq.width * .3,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: whiteColor, boxShadow: [
                                          BoxShadow(
                                            color: black27Color.withOpacity(.1),
                                            blurRadius: 8,
                                            offset: const Offset(3, 3), // changes position of shadow
                                          ),
                                        ]),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.bookmark_border_outlined,
                                              color: primaryColor,
                                            ),
                                            SizedBox(
                                              width: mq.width * .014,
                                            ),
                                            CommonText(text: "Save for later", fontSize: fo12, fontWeight: f400, fontColor: blackColor)
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          value.fetchRemoveItemFromCartPutApi(value.cartListModel.data?.items?[index].productId?.id.toString() ?? " ");
                                        },
                                        child: Container(
                                          height: mq.height * .035,
                                          padding: EdgeInsets.symmetric(horizontal: mqWidth5),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: whiteColor, boxShadow: [
                                            BoxShadow(
                                              color: black27Color.withOpacity(.1),
                                              blurRadius: 8,
                                              offset: const Offset(3, 3), // changes position of shadow
                                            ),
                                          ]),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: primaryColor,
                                              ),
                                              SizedBox(
                                                width: mq.width * .006,
                                              ),
                                              CommonText(text: "Remove from cart", fontSize: fo12, fontWeight: f400, fontColor: blackColor)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
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
