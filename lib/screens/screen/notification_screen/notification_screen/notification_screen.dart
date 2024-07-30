import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/constant/mq_constant.dart';
import 'package:new_quickly_desige/helper/custom_sizebox.dart';
import 'package:new_quickly_desige/helper/loader_helper.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/notification_screen/notification_provider/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      context.read<NotificationProvider>().fetchNotificationListGetApi();
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Consumer<NotificationProvider>(
      builder: (BuildContext context, NotificationProvider value, Widget? child) {
        return value.isLoading
            ? loadingIndicator()
            : Scaffold(
                ///-------------------------------app bar------------------------///
                appBar: AppBar(
                  title: CommonText1(text: "Notification", fontSize: fo20, fontWeight: fBoldFont, fontColor: blackColor),
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

                ///-------------------------------body------------------------///
                body: value.notificationListModel.data ==  null || value.notificationListModel.data?.isEmpty == true
                    ? const Center(child: Text("Notification Not Found"))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: mqWidth15),
                        child: Column(
                          children: [
                            mqHeight15.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(text: "Today", fontSize: fo12, fontWeight: fBoldFont, fontColor: brown9fColor),
                                GestureDetector(
                                    onTap: () {
                                      value.fetchReadNotificationGetApi(value.notificationListModel.data?[0].id.toString() ?? '');
                                    },
                                    child: CommonText(text: "Mark all as read", fontSize: fo12, fontWeight: fBoldFont, fontColor: primaryColor)),
                              ],
                            ),
                            mqHeight25.ph,
                            Expanded(
                              child: ListView.separated(
                                itemCount: value.notificationListModel.data?.length ?? 0,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      mqHeight10.ph,
                                      Padding(
                                        padding: EdgeInsets.only(right: mqHeight45),
                                        child: Divider(
                                          color: brown98Color.withOpacity(.3),
                                        ),
                                      ),
                                      mqHeight10.ph,
                                    ],
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onLongPress: () {
                                      value.fetchDelectNotificationDelectApi(value.notificationListModel.data?[index].id.toString() ?? "");
                                    },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      //   horizontalTitleGap: 0,
                                      minVerticalPadding: 0,
                                      minLeadingWidth: 0,
                                      dense: true,
                                      tileColor: whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      leading: Container(
                                        height: mqHeight45,
                                        width: mqWidth45,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.notifications_none_outlined, color: whiteColor, size: 26),
                                        ),
                                      ),
                                      title: Align(
                                        alignment: Alignment.centerLeft,
                                        child: CommonText(text: value.notificationListModel.data?[index].title.toString() ?? "", fontSize: fo18, fontWeight: fBoldFont, fontColor: blackColor),
                                      ),
                                      subtitle: CommonText(
                                          text: value.notificationListModel.data?[index].description.toString() ?? "",
                                          fontSize: fo12,
                                          fontWeight: f400,
                                          textAlign: TextAlign.left,
                                          fontColor: brown57Color),
                                      trailing: CommonText(text: "5m", fontSize: fo12, fontWeight: fBoldFont, fontColor: brown9fColor),
                                    ),
                                  );
                                },
                              ),
                            ),
                            mqHeight30.ph,
                          ],
                        ),
                      ),
              );
      },
    );
  }
}
