import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:provider/provider.dart';
import '../../../../../../constant/app_color.dart';
import '../../../../../../constant/common_text.dart';
import '../../../../../../constant/font_style.dart';
import '../../../../../../constant/mq_constant.dart';
import '../../../../../../main.dart';
import '../../../address_screen/address_screen/address_screen.dart';
import '../../select_address_provider/select_address_provider.dart';

class ListViewData extends StatefulWidget {
  const ListViewData({
    super.key,
    required this.value,
  });

  final SelectAddressProvider value;

  @override
  State<ListViewData> createState() => _ListViewDataState();
}

class _ListViewDataState extends State<ListViewData> {

  String selectAddressId = "selectAddressId";

  @override
  Widget build(BuildContext context) {
    var value = widget.value;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: value.addressListModel.data?.length ?? 0,
      separatorBuilder: (context, index) {
        return mqHeight15.ph;
      },
      itemBuilder: (context, index) {
        bool isDefaultAddress =  (value.addressListModel.data?[index].isDefault ?? false) ;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: mqWidth15),
          child: Column(
            children: [
              Container(
                width: mq.width,
                padding: EdgeInsets.symmetric(vertical: mqHeight10),
                decoration: BoxDecoration(
                    color: selectAddressId ==
                            value.addressListModel.data?[index].id
                        ? secondaryColor
                        : whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: black27Color.withOpacity(.2),
                        blurRadius: 6,
                        offset:
                            const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    border: selectAddressId ==
                            value.addressListModel.data?[index].id
                        ? Border.all(color: primaryColor, width: 1)
                        : null),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                        activeColor: primaryColor,
                        value: value.addressListModel.data?[index].isDefault,
                        groupValue: true ,

                        onChanged: (val) {
                          log("radio val  :: ${val}");
                          log("ISDEFAULT :: ${value.addressListModel.data?[index].isDefault}");
                          setState(() {
                            value.addressListModel.data?[index].isDefault = (val ?? false)  ;
                          });


                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText1(
                                text: value.addressListModel.data?[index].name
                                        .toString() ??
                                    "",
                                fontSize: fo15,
                                fontWeight: fBoldFont,
                                fontColor: blackColor),
                            mqWidth5.pw,
                            selectAddressId ==
                                    value.addressListModel.data?[index].id
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: mqHeight2,
                                        horizontal: mqWidth5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: primaryColor, width: 1),
                                    ),
                                    child: Center(
                                      child: CommonText(
                                          text: "Default",
                                          fontSize: fo10,
                                          fontWeight: f400,
                                          fontColor: primaryColor),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        mqHeight10.ph,
                        CommonText(
                          text:
                              'Street : ${value.addressListModel.data?[index].street.toString() ?? ""}',
                          fontSize: fo12,
                          fontWeight: f500,
                          fontColor: blackColor,
                        ),
                        mqHeight5.ph,
                        CommonText(
                          text:
                              'City : ${value.addressListModel.data?[index].city.toString() ?? ""}',
                          fontSize: fo12,
                          fontWeight: f500,
                          fontColor: blackColor,
                        ),
                        mqHeight5.ph,
                        CommonText(
                          text:
                              ' State/Province/Area : ${value.addressListModel.data?[index].state.toString() ?? ""}',
                          fontSize: fo12,
                          fontWeight: f500,
                          fontColor: blackColor,
                        ),
                        mqHeight5.ph,
                        CommonText(
                          text:
                              ' Phone Number : ${value.addressListModel.data?[index].mobileNumber.toString() ?? ""}',
                          fontSize: fo12,
                          fontWeight: f500,
                          fontColor: blackColor,
                        ),
                        mqHeight5.ph,
                        SizedBox(
                          width: (mq.width - mqWidth120),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text:
                                    ' Country : ${value.addressListModel.data?[index].country.toString() ?? ""}',
                                fontSize: fo12,
                                fontWeight: f500,
                                fontColor: blackColor,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mqWidth10, vertical: mqHeight5),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: black27Color.withOpacity(.2),
                                      blurRadius: 6,
                                      offset: const Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        color: primaryColor,
                                        size: 18,
                                      ),
                                      mqWidth2.pw,
                                      GestureDetector(
                                          onTap: () {
                                            context
                                                .read<SelectAddressProvider>()
                                                .nameController
                                                .text = value.addressListModel
                                                    .data?[index].name
                                                    .toString() ??
                                                '';
                                            context
                                                .read<SelectAddressProvider>()
                                                .houseController
                                                .text = value.addressListModel
                                                    .data?[index].houseName
                                                    .toString() ??
                                                '';
                                            context
                                                .read<SelectAddressProvider>()
                                                .streetNameController
                                                .text = value.addressListModel
                                                    .data?[index].street
                                                    .toString() ??
                                                '';
                                            context
                                                .read<SelectAddressProvider>()
                                                .cityNameController
                                                .text = value.addressListModel
                                                    .data?[index].city
                                                    .toString() ??
                                                '';
                                            context
                                                .read<SelectAddressProvider>()
                                                .stateNameController
                                                .text = value.addressListModel
                                                    .data?[index].state
                                                    .toString() ??
                                                '';
                                            context
                                                .read<SelectAddressProvider>()
                                                .phoneNumberController
                                                .text = value.addressListModel
                                                    .data?[index].mobileNumber
                                                    .toString() ??
                                                '';

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddressScreen(
                                                    id: value.addressListModel
                                                            .data?[index].id
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ));
                                          },
                                          child: CommonText(
                                              text: "Edit Address",
                                              fontSize: fo12,
                                              fontWeight: f500,
                                              fontColor: blackColor)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flexible(child: Container()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
