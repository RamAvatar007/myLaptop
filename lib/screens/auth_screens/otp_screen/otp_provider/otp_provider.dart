import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/bottom_bar_tabs_screen/bottom_bar_tab_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class OtpProvider with ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  otpPostApiData(BuildContext context) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "country_code": "91",
      "otp": otpController.text,
      "type": "Customer"
    };

    if(StorageHelper().getUserEmail() != null ){
      params["email"] =  StorageHelper().getUserEmail();
    }else{
      params["mobile_number"] =  StorageHelper().getUserPhone();
    }

    RestClient.fetchVerifyOtpPostApi(params).then((value) {
      isLoading = false;
      notifyListeners();
      StorageHelper().setUserBearerToken(value['data']['token']);
      StorageHelper().setUserPhone(value['data']['user']['mobile_number']);
      StorageHelper().setUserEmail(value['data']['user']['email']);
      StorageHelper().setUserName(value['data']['user']['name']);
      StorageHelper().setUserPassword(value['data']['user']['password']);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarTabScreen(),
          ));
      otpController.clear();
      toastMessage(value['message']);
    }).onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();
      toastMessage("Invalid OTP, Please enter correct OTP");
      log("Error : $error");
      log("stackTrace : $stackTrace");
    });
  }


  //// Resend Otp Apply here!!!

  mailResendOtp() {
    isLoading = true;
    notifyListeners();
    Map params = {
      "email": StorageHelper().getUserEmail().toString(),
      "login_type": "email",
      "country_code": "91",
      "type": "Customer"
    };
    RestClient.fetchSendOtpPostApi(params).then((value) {
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }

  phoneResendOtp() {
    isLoading = true;
    notifyListeners();
    Map params = {
      "mobile_number": StorageHelper().getUserPhone().toString(),
      "login_type": "mobile_number",
      "country_code": "91",
      "type": "Customer"
    };
    RestClient.fetchSendOtpPostApi(params).then((value) {
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }
}
