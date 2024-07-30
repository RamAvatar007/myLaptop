import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/bottom_bar_tabs_screen/bottom_bar_tab_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class LoginWithPasswordProvider with ChangeNotifier {
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  loginWithPasswordPhonePostApiData(BuildContext context) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "country_code": "91",
      "mobile_number": StorageHelper().getUserPhone(),
      "password": password.text.toString(),
      "type": "Customer"
    };
    RestClient.fetchLoginWithPasswordPostApi(params).then((value) {
      StorageHelper().setUserBearerToken(value['data']['token']);
      StorageHelper().setUserPhone(value['data']['user']['mobile_number']);
      StorageHelper().setUserEmail(value['data']['user']['email']);
      StorageHelper().setUserName(value['data']['user']['name']);
      isLoading = false;
      notifyListeners();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomBarTabScreen()));
     toastMessageSuccessfully(value["message"]);
    }).onError((error, stackTrace) {
      toastMessage("Failed the login !!");
      log("Error : $error");
      isLoading = false;
      notifyListeners();
    });
  }

  loginWithPasswordEmailPostApiData(BuildContext context) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "country_code": "91",
      "email": StorageHelper().getUserEmail(),
      "password": password.text.toString(),
      "type": "Customer"
    };
    RestClient.fetchLoginWithPasswordPostApi(params).then((value) {
      StorageHelper().setUserBearerToken(value['data']['token']);
      StorageHelper().setUserPhone(value['data']['user']['mobile_number']);
      StorageHelper().setUserEmail(value['data']['user']['email']);
      StorageHelper().setUserName(value['data']['user']['name']);
      StorageHelper().setUserPassword(value['data']['user']['password']);
      isLoading = false;
      notifyListeners();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomBarTabScreen()));
      toastMessageSuccessfully(value["message"]);
    }).onError((error, stackTrace) {
      log("Error : $error");
      toastMessage("Failed the login!!");
      isLoading = false;
      notifyListeners();
    });
  }
}
