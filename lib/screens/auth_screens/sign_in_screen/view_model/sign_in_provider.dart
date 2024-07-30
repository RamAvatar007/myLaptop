// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:new_quickly_desige/helper/storage_helper.dart';
// import 'package:new_quickly_desige/network_manager/rest_client.dart';
// import 'package:new_quickly_desige/screens/auth_screens/otp_screen/otp_screen.dart';
// import 'package:new_quickly_desige/utils/toast_message.dart';

// class MailSendOtpProvider with ChangeNotifier {
//   TextEditingController emailController = TextEditingController();
//   bool isLoading = false;

//   mailSendOtpPostApiData(BuildContext context) {
//     isLoading = true;
//     notifyListeners();
//     if (emailController.text.contains('@')) {
//       Map params = {
//         "email": emailController.text,
//         "login_type": "email",
//         "country_code": "91",
//         "type": "Customer"
//       };
//       RestClient.fetchSendOtpPostApi(params).then((value) {
//         StorageHelper().setUserEmail(emailController.text.toString());
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => OtpScreen(
//                       email: emailController.text.toString(),
//                     )));
//         toastMessage(value['message']);
//       }).onError((error, stackTrace) {
//         if (kDebugMode) {
//           print("Error : $error");
//         }
//         isLoading = false;
//         notifyListeners();
//       });
//     } else {
//       Map params = {
//         "mobile_number": emailController.text,
//         "login_type": "mobile_number",
//         "country_code": "91",
//         "type": "Customer"
//       };
//       RestClient.fetchSendOtpPostApi(params).then((value) {
//         StorageHelper().setUserPhone(emailController.text.toString());
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => OtpScreen(
//                       email: emailController.text.toString(),
//                     )));
//         toastMessage(value['message']);
//       }).onError((error, stackTrace) {
//         if (kDebugMode) {
//           print("Error : $error");
//         }
//         isLoading = false;
//         notifyListeners();
//       });
//     }
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:new_quickly_desige/helper/storage_helper.dart';
// import 'package:new_quickly_desige/network_manager/rest_client.dart';
// import 'package:new_quickly_desige/screens/auth_screens/otp_screen/otp_screen.dart';
// import 'package:new_quickly_desige/utils/toast_message.dart';

// class MailSendOtpProvider with ChangeNotifier {
//   TextEditingController emailController = TextEditingController();
//   bool isLoading = false;

//   Future<void> mailSendOtpPostApiData(BuildContext context) async {
//     isLoading = true;
//     notifyListeners();

//     Map<String, String> params = {
//       "login_type": emailController.text.contains('@') ? "email" : "mobile_number",
//       "country_code": "91",
//       "type": "Customer",
//     };

//     if (params["login_type"] == "email") {
//       params["email"] = emailController.text;
//     } else {
//       params["mobile_number"] = emailController.text;
//     }

//     try {
//       final value = await RestClient.fetchSendOtpPostApi(params);

//       if (params["login_type"] == "email") {
//         StorageHelper().setUserEmail(emailController.text);
//       } else {
//         StorageHelper().setUserPhone(emailController.text);
//       }

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => OtpScreen(
//             email: emailController.text,
//           ),
//         ),
//       );
//       toastMessage(value['message']);
//     } catch (error) {
//       if (kDebugMode) {
//         print("Error : $error");
//       }
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/helper/storage_helper.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/screens/auth_screens/otp_screen/otp_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class MailSendOtpProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> mailSendOtpPostApiData(context) async {
    isLoading = true;
    notifyListeners();

    final isEmail = emailController.text.contains('@');
    final params = {
      "login_type": isEmail ? "email" : "mobile_number",
      "country_code": "91",
      "type": "Customer",
      if (isEmail) "email": emailController.text,
      if (!isEmail) "mobile_number": emailController.text,
    };

    try {
      final value = await RestClient.fetchSendOtpPostApi(params);
      if (isEmail) StorageHelper().setUserEmail(emailController.text.toString());
      if (!isEmail) StorageHelper().setUserPhone(emailController.text.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(email: emailController.text),
        ),
      );
      toastMessage(value['message']);
    } catch (error, stackTrace) {
      log("\n mailSendOtpPostApiData Error: $error");
      log("\n mailSendOtpPostApiData stackTrace: $stackTrace");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }




}
