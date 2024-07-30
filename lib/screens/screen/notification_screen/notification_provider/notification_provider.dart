import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:new_quickly_desige/models/notification_list_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';

class NotificationProvider extends ChangeNotifier{
  bool isLoading = true;
  NotificationListModel notificationListModel = NotificationListModel();
  fetchNotificationListGetApi(){
    isLoading = true;
    notifyListeners();
    RestClient.fetchNotificationListGetApi().then((value){
      notificationListModel = value;
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("\n fetchNotificationListGetApi error : $error");
      log("\n fetchNotificationListGetApi stackTrace : $stackTrace");
      isLoading = false;
      notifyListeners();
    },);
  }

  fetchReadNotificationGetApi(String id){
    isLoading = true;
    notifyListeners();
    RestClient.fetchReadNotificationGetApi(id).then((value){
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("\n fetchReadNotificationGetApi error : $error");
      log("\n fetchReadNotificationGetApi stackTrace : $stackTrace");
      isLoading = false;
      notifyListeners();
    },);
  }

  fetchDelectNotificationDelectApi(String id){
    isLoading = true;
    notifyListeners();
    RestClient.fetchDeleteNotificationDeleteApi(id).then((value){
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("\n fetchDelectNotificationDelectApi error : $error");
      log("\n fetchDelectNotificationDelectApi stackTrace : $stackTrace");
      isLoading = false;
      notifyListeners();
    },);
  }
}
