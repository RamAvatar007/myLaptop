import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool turnOnNotification = false;
  bool subscribeNewsletter = false;
  bool enableFaceID = false;

  updateTurnOnNotification(bool status) {
    turnOnNotification = status;
    notifyListeners();
  }

  updateSubscribeNewsletter(bool status) {
    subscribeNewsletter = status;
    notifyListeners();
  }

  updateEnableFaceID(bool status) {
    enableFaceID = status;
    notifyListeners();
  }

  ///--------------Select Language--------------///
  String language = "English";
  updateLanguage(String status) {
    language = status;
    notifyListeners();
  }


}
