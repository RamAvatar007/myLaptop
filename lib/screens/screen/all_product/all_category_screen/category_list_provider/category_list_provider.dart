import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/category_list_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class CategoryListProvider with ChangeNotifier {
  bool isLoading = true;
  CategoryListModel categoryListModel = CategoryListModel();
  categoryListGetApiData() {
    RestClient.fetchCategoryListGetApi().then((value) {
      categoryListModel = value;
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      log("error : $error");
      log("stackTrace : $stackTrace");
      isLoading = false;
      notifyListeners();
    });
  }
}
