import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/product_list_model.dart';
import 'package:new_quickly_desige/models/vendor_list_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';

class VendorListProvider with ChangeNotifier {
  bool isLoading = true;
  VendorListModel vendorListModel = VendorListModel();
  vendorListGetApiData(String categoryId) {
    isLoading = true;
    notifyListeners();
    RestClient.fetchVendorListGetApi(categoryId).then((value) {
      vendorListModel = value;
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("error : $error");
      log("stackTrace : $stackTrace");
    });
  }


ProductListModel productListModel = ProductListModel();
  fetchProductListGetApi() {
    isLoading = true;
    notifyListeners();
    RestClient.fetchProductListGetApi().then((value) {
      productListModel = value;
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("error : $error");
      log("stackTrace : $stackTrace");
    });
  }
}
