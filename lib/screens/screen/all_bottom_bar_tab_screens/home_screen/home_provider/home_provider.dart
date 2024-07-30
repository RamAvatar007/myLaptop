import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/dashboard_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';

class DashBoardProvider extends ChangeNotifier {
  bool isLoading = false;
  DashboardModel dashboardModel = DashboardModel();

  dashboardGetApiData() {
    isLoading = true;
    notifyListeners();
    RestClient.fetchDashboardGetApi().then((value) {
      isLoading = false;
      notifyListeners();
      dashboardModel = value;
      log('value $value');
    }).onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();
      log('error $error');
      log('stackTrace $stackTrace');
    });
  }
}
