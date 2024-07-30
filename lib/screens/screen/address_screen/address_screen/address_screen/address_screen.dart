import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/Common_text_field.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/select_address_provider/select_address_provider.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  final String? id;
  const AddressScreen({super.key, this.id});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Consumer<SelectAddressProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? loadingIndicator()
            : Scaffold(

                ///----------------App bar-------------------///
                appBar: AppBar(
                  backgroundColor: whiteColor,
                  centerTitle: true,
                  title: CommonText1(
                    text: 'Add Address',
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

                ///----------------Floating action button-------------------///

                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                  child: GestureDetector(
                    onTap: () {
                      widget.id != null ? value.fetchUpdateAddressPutApi(widget.id.toString(), context) : value.fetchEditAddressPostApi(context);
                    },
                    child: Container(
                      height: mqHeight75,
                      width: mq.width,
                      decoration: BoxDecoration(
                          color: primaryColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
                      child: Center(
                        child: CommonText(
                          text: 'SAVE TO ADDRESS',
                          fontSize: fo20,
                          fontWeight: f500,
                          fontColor: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),

                ///----------------Body-------------------///
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mqHeight20.ph,
                        CommonText(text: "Name", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.nameController,
                          hintText: "Mahatma",
                        ),
                        SizedBox(height: mqHeight20),
                        CommonText(text: "House/Office Name", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.houseController,
                          hintText: "Ex. Al Samwa Plaza",
                        ),
                        SizedBox(height: mqHeight20),
                        CommonText(text: "Street", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.streetNameController,
                          hintText: "Ex. P.O.Box 1514",
                        ),
                        SizedBox(height: mqHeight20),
                        CommonText(text: "City", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.cityNameController,
                          hintText: "Ex. Habib Bank Bldg",
                        ),
                        SizedBox(height: mqHeight20),
                        CommonText(text: "State/Province/Area", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.stateNameController,
                          hintText: "Ex. Al Hail",
                        ),
                        SizedBox(height: mqHeight20),
                        CommonText(text: "Phone Number", fontSize: fo15, fontWeight: f500, fontColor: blackColor),
                        SizedBox(
                          height: mqHeight10,
                        ),
                        CommonTextFormField1(
                          controller: value.phoneNumberController,
                          //   controller: value.phoneNumberController..text=widget.phone.toString(),
                          hintText: "+968 7216 2709",
                        ),
                        SizedBox(height: mqHeight10),
                        Transform.translate(
                          offset: Offset(-mqWidth10, 0),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: value.makeDefaultAddress,
                                  side: BorderSide(width: 1, color: primaryColor),
                                  activeColor: primaryColor,
                                  onChanged: (newValue) {
                                    value.changeIsDefaultAddress(newValue ?? false);
                                  }),
                              CommonText(text: "Make Default Address", fontSize: fo13, fontWeight: f500, fontColor: blackColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
      },
    );
  }
}
