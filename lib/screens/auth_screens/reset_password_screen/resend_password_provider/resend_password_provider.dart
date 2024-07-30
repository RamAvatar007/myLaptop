import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/screens/auth_screens/verify_and_reset_password_screen/verify_and_reset_password_screen/verify_and_reset_password_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class ResendPasswordProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  resendPasswordPostApiData(BuildContext context) {
    Map params = {"country_code": "91", "mobile_number": emailController.text};
    RestClient.fetchForgotPasswordPostApi(params).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VerifyAndResetPasswordScreen(),
          ));
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      toastMessage("message");
      log("Error : $error");
      isLoading = false;
      notifyListeners();
    });
  }
}
