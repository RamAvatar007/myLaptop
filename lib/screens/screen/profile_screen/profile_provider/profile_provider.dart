import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/profile_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';

class ProfileProvider extends ChangeNotifier {




  bool isLoading = false;
  fetchUpLoadImageMultipartApi({required File imagePath}) {
    isLoading = true;
    notifyListeners();
    RestClient.fetchUploadImageMultipartApi(imagePath).then((value) {
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\nfetchUpLoadImageMultipartApi error : $error");
        log("\nfetchUpLoadImageMultipartApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  ///--------profile get api

  ProfileModel profileModel = ProfileModel();
  fetchProfileGetApi() {
    isLoading = true;
    notifyListeners();
    RestClient.fetchProfileGetApi().then((value) {
      profileModel = value;
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\nfetchProfileGetApi error : $error");
        log("\nfetchProfileGetApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
