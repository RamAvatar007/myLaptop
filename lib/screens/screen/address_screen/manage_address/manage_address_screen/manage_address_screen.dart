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
import 'package:provider/provider.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({super.key});
  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SelectAddressProvider>().fetchAddressListGetApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectAddressProvider>(
      builder: (BuildContext context, SelectAddressProvider value, Widget? child) {
        return value.isLoading
            ? loadingIndicator()
            : Scaffold(

                ///----------app bar ----------///
                appBar: AppBar(
                  backgroundColor: whiteColor,
                  centerTitle: true,
                  title: CommonText1(
                    text: 'Manage Address',
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

                ///----------------Floating action button-------------------///


            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                floatingActionButton: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddressScreen(),
                        ));
                  },
                  child: Container(
                    height: mqHeight75,
                    width: mq.width,
                    decoration: BoxDecoration(color: primaryColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
                    child: Center(
                      child: CommonText(
                        text: 'ADD NEW ADDRESS',
                        fontSize: fo20,
                        fontWeight: f500,
                        fontColor: whiteColor,
                      ),
                    ),
                  ),
                ),

                ///----------body----------///
                body: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: ListView.separated(
                    itemCount: value.addressListModel.data?.length ?? 0,
                    separatorBuilder: (context, index) {
                      return mqHeight15.ph;
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: mqWidth15),
                        child: Column(
                          children: [
                            Container(
                              width: mq.width,
                              padding: EdgeInsets.symmetric(vertical: mqHeight10, horizontal: mqWidth15),
                              decoration: BoxDecoration(
                                  color: value.addressListModel.data?[index].isDefault == true ? secondaryColor : whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: black27Color.withOpacity(.2),
                                      blurRadius: 6,
                                      offset: const Offset(3, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  border: true == value.addressListModel.data?[index].isDefault ? Border.all(color: primaryColor, width: 1) : null),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CommonText1(text: value.addressListModel.data?[index].name.toString() ?? "", fontSize: fo15, fontWeight: fBoldFont, fontColor: blackColor),
                                          mqWidth5.pw,
                                          true == value.addressListModel.data?[index].isDefault
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(vertical: mqHeight2, horizontal: mqWidth5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: primaryColor, width: 1),
                                                  ),
                                                  child: Center(
                                                    child: CommonText(text: "Default", fontSize: fo10, fontWeight: f400, fontColor: primaryColor),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      mqHeight10.ph,
                                      CommonText(
                                        text: 'Street : ${value.addressListModel.data?[index].street.toString() ?? ""}',
                                        fontSize: fo12,
                                        fontWeight: f500,
                                        fontColor: blackColor,
                                      ),
                                      mqHeight5.ph,
                                      CommonText(
                                        text: 'City : ${value.addressListModel.data?[index].city.toString() ?? ""}',
                                        fontSize: fo12,
                                        fontWeight: f500,
                                        fontColor: blackColor,
                                      ),
                                      mqHeight5.ph,
                                      CommonText(
                                        text: ' State/Province/Area : ${value.addressListModel.data?[index].state.toString() ?? ""}',
                                        fontSize: fo12,
                                        fontWeight: f500,
                                        fontColor: blackColor,
                                      ),
                                      mqHeight5.ph,
                                      CommonText(
                                        text: ' Phone Number : ${value.addressListModel.data?[index].mobileNumber.toString() ?? ""}',
                                        fontSize: fo12,
                                        fontWeight: f500,
                                        fontColor: blackColor,
                                      ),
                                      mqHeight5.ph,
                                      CommonText(
                                        text: ' Country : ${value.addressListModel.data?[index].country.toString() ?? ""}',
                                        fontSize: fo12,
                                        fontWeight: f500,
                                        fontColor: blackColor,
                                      ),
                                    ],
                                  ),
                                  Flexible(child: Container()),
                                  Column(
                                    children: [
                                      true == value.addressListModel.data?[index].isDefault
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                value.fetchRemoveAddressDelectApi(value.addressListModel.data?[index].id.toString() ?? '', context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: mqWidth10, vertical: mqHeight5),
                                                decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: black27Color.withOpacity(.2),
                                                        blurRadius: 6,
                                                        offset: const Offset(3, 3), // changes position of shadow
                                                      ),
                                                    ],
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: primaryColor, width: 1)),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.delete_outline_outlined,
                                                        color: primaryColor,
                                                        size: 18,
                                                      ),
                                                      mqWidth2.pw,
                                                      CommonText(text: "Remove", fontSize: fo12, fontWeight: f500, fontColor: primaryColor),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      mqHeight5.ph,
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: mqWidth10, vertical: mqHeight5),
                                        decoration: BoxDecoration(
                                            color: true == value.addressListModel.data?[index].isDefault ? Colors.transparent : whiteColor,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: primaryColor, width: 1)),
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
                                                    context.read<SelectAddressProvider>().nameController.text = value.addressListModel.data![index].name.toString();
                                                    context.read<SelectAddressProvider>().houseController.text = value.addressListModel.data![index].houseName.toString();
                                                    context.read<SelectAddressProvider>().streetNameController.text = value.addressListModel.data![index].street.toString();
                                                    context.read<SelectAddressProvider>().cityNameController.text = value.addressListModel.data![index].city.toString();
                                                    context.read<SelectAddressProvider>().stateNameController.text = value.addressListModel.data![index].state.toString();
                                                    context.read<SelectAddressProvider>().phoneNumberController.text = value.addressListModel.data![index].mobileNumber.toString();

                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => AddressScreen(
                                                            id: value.addressListModel.data?[index].id.toString() ?? '',
                                                          ),
                                                        ));
                                                  },
                                                  child: CommonText(text: "Edit Address", fontSize: fo12, fontWeight: f500, fontColor: blackColor)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      mqHeight5.ph,
                                      true == value.addressListModel.data?[index].isDefault
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                value.fetchDefaultAddressPutApi(value.addressListModel.data?[index].id.toString() ?? '', context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: mqWidth10, vertical: mqHeight5),
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: black27Color.withOpacity(.2),
                                                      blurRadius: 6,
                                                      offset: const Offset(3, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.check_circle_outline_outlined,
                                                        color: whiteColor,
                                                        size: 18,
                                                      ),
                                                      mqWidth2.pw,
                                                      CommonText(text: "Make Default", fontSize: fo12, fontWeight: f500, fontColor: whiteColor),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ));
      },
    );
  }
}
