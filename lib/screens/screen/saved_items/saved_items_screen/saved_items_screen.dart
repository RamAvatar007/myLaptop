import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/common_text_form_field.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/saved_items/saved_items_screen/saved_item_screen_bottom%20_data.dart';

class SavedItemScreen extends StatefulWidget {
  const SavedItemScreen({super.key});

  @override
  State<SavedItemScreen> createState() => _SavedItemScreenState();
}

class _SavedItemScreenState extends State<SavedItemScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      ///-------------------App Bar---------------------------///

      appBar: AppBar(
        title: CommonText1(
            text: "Saved Items",
            fontSize: fo20,
            fontWeight: fBoldFont,
            fontColor: blackColor),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),

      ///-------------------body---------------------------///
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: mqWidth15), //EdgeInsets.all(8.0),
        child: Column(
          children: [
            mqHeight5.ph,
            Row(
              children: [
                Flexible(
                    child: Container(
                  height: mq.height * .05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(.1),
                          blurRadius: 6,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ]),
                  child: CommonTextFormField(
                    hintText: "Search for your saved items",
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
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(.1),
                          blurRadius: 6,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    child: Icon(
                      Icons.filter_list_outlined,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            mqHeight10.ph,
            const Expanded(child: SavedItemScreenBottomData()),
          ],
        ),
      ),
    );
  }
}
