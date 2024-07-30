import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/address_list_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/screens/screen/all_bottom_bar_tab_screens/account_screen/account_screen.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class SelectAddressProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingDeleteAddress = false;
  AddressListModel addressListModel = AddressListModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool makeDefaultAddress = false;

  AddressModel? selectedAddress = AddressModel();

  Future<void> getSelectedAddress() async {
    if (addressListModel.data != null && addressListModel.data!.isNotEmpty) {
      for (var address in addressListModel.data!) {
        if (address.isDefault == true) {
          selectedAddress = address;
          notifyListeners();
        }
      }
    }
  }

  void changeIsDefaultAddress(bool status) {
    makeDefaultAddress = status;
    notifyListeners();
  }

  fetchEditAddressPostApi(context) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "name": nameController.text.toString(),
      "house_name": houseController.text.toString(),
      "city": cityNameController.text.toString(),
      "street": stateNameController.text.toString(),
      "state": stateNameController.text.toString(),
      "is_default": makeDefaultAddress,
      "postal_code": " ",
      "country_code": "+91",
      "location": " ",
      "latitude": "107.5",
      "longitude": "103.1",
      "mobile_number": phoneNumberController.text.toString(),
      "country": "India"
    };
    RestClient.fetchEditAddressPostApi(params).then((value) {
      nameController.clear();
      houseController.clear();
      streetNameController.clear();
      cityNameController.clear();
      stateNameController.clear();
      phoneNumberController.clear();
      makeDefaultAddress = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AccountScreen(),
        ),
      );
      toastMessage(value['message']);
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        notifyListeners();
        debugPrint("fetchEditAddressPostApi error : $error");
        debugPrint("fetchEditAddressPostApi stackTrace : $stackTrace");
      },
    );
  }

  Future<void> fetchAddressListGetApi() async {
    isLoading = true;
    notifyListeners();
    RestClient.fetchAddressListGetApi(1, 30).then((value) {
      isLoading = false;
      notifyListeners();
      addressListModel = value;
    }).onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();
      log("fetchAddressListGetApi error: $error");
      log("fetchAddressListGetApi stackTrace: $stackTrace");
    });
  }

  fetchUpdateAddressPutApi(String productId, context) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "name": nameController.text.toString(),
      "house_name": houseController.text.toString(),
      "city": cityNameController.text.toString(),
      "street": streetNameController.text.toString(),
      "state": stateNameController.text.toString(),
      "country": "India",
      "is_default": makeDefaultAddress,
      "postal_code": "302020",
      "country_code": "91",
      "mobile_number": phoneNumberController.text.toString()
    };
    RestClient.fetchUpdateAddressPutApi(params, productId).then((value) {
      nameController.clear();
      houseController.clear();
      streetNameController.clear();
      cityNameController.clear();
      stateNameController.clear();
      phoneNumberController.clear();
      makeDefaultAddress = false;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountScreen(),
          ));
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchUpdateAddressPutApi error : $error");
        log("\n fetchUpdateAddressPutApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  fetchDefaultAddressPutApi(String productId, context) {
    isLoading = true;
    notifyListeners();
    RestClient.fetchDefaultAddressPutApi(productId).then((value) async {
      await fetchAddressListGetApi();
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchDefaultAddressPutApi error : $error");
        log("\n fetchDefaultAddressPutApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  fetchRemoveAddressDelectApi(String productId, context) {
    isLoading = true;
    notifyListeners();
    RestClient.fetchRemoveAddressDeleteApi(productId).then((value) async {
      await fetchAddressListGetApi();
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchRemoveAddressDelectApi error : $error");
        log("\n fetchRemoveAddressDelectApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
