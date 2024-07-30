import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/product_details_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';

class ProductDetailsProvider extends ChangeNotifier{
  bool isLoading = true;
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  fetchProductDetailsGetApi(String productId){
    isLoading = true;
    notifyListeners();
    RestClient.fetchProductDetailsGetApi(productId).then((value){
      productDetailsModel = value;
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("\nfetchProductDetailsGetApi error : $error");
      log("\nfetchProductDetailsGetApi stackTrace : $stackTrace");
      isLoading = false;
      notifyListeners();
    },);
  }

  int productQuentity = 1;
  increment(){
    ++productQuentity;
    notifyListeners();
  }
  decrement(){
    if(productQuentity <= 1){
    }else{
      productQuentity--;
      notifyListeners();
    }
  }
}