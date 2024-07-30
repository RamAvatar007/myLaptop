import 'dart:io';
import 'package:new_quickly_desige/models/address_list_model.dart';
import 'package:new_quickly_desige/models/cart_list_model.dart';
import 'package:new_quickly_desige/models/category_list_model.dart';
import 'package:new_quickly_desige/models/dashboard_model.dart';
import 'package:new_quickly_desige/models/notification_list_model.dart';
import 'package:new_quickly_desige/models/product_details_model.dart';
import 'package:new_quickly_desige/models/product_list_model.dart';
import 'package:new_quickly_desige/models/profile_model.dart';
import 'package:new_quickly_desige/models/vendor_list_model.dart';
import 'http_helper.dart';
import 'network_constant.dart';

class RestClient {
  static final HttpHelper _httpHelper = HttpHelper();

  ///--------------------------------------------------///
  ///-------->>>>>>>>>>>>--Post Api-<<<<<<<<<<<<<-----///
  ///-------------------------------------------------///
  ///--------- Sign up Post Api
  static Future<dynamic> fetchSignUpPostApi(Object params) async {
    var response = await _httpHelper.post(url: NetworkConstant.signUpUrl, requestBody: params);
    return response;
  }

  ///--------- Send Otp Post Api
  static Future<dynamic> fetchSendOtpPostApi(Object params) async {
    var response = await _httpHelper.post(url: NetworkConstant.sendOtpMailUrl, requestBody: params);
    return response;
  }

  ///--------- Verify Otp Post Api
  static Future<dynamic> fetchVerifyOtpPostApi(Object params) async {
    Map<String, dynamic> response = await _httpHelper.post(url: NetworkConstant.verifyOtpUrl, requestBody: params);
    return response;
  }

  ///--------- login with password Post Api
  static Future<dynamic> fetchLoginWithPasswordPostApi(Object params) async {
    Map<String, dynamic> response = await _httpHelper.post(url: NetworkConstant.loginUrl, requestBody: params);
    return response;
  }

  ///--------- Resend otp post api
  static Future<dynamic> fetchResendOtpPostApi(Object params) async {
    Map<String, dynamic> response = await _httpHelper.post(url: NetworkConstant.loginUrl, requestBody: params, isRequireAuthorization: true);
    return response;
  }

  ///--------- forgot Password post api
  static Future<dynamic> fetchForgotPasswordPostApi(Object params) async {
    Map<String, dynamic> response = await _httpHelper.post(url: NetworkConstant.forgotPasswordUrl, requestBody: params, isRequireAuthorization: true);
    return response;
  }

  ///--------- Upload Image Post Api
  static Future<dynamic> fetchUploadImagePostApi(Object params) async {
    var response = await _httpHelper.post(url: NetworkConstant.uploadImagePostApiUrl, isRequireAuthorization: true, requestBody: params);
    return response;
  }

  static Future<dynamic> fetchEditAddressPostApi(Object params) async {
    var response = await _httpHelper.post(url: NetworkConstant.editAddressPostApiUrl, isRequireAuthorization: true, requestBody: params);
    return response;
  }


  static Future<dynamic> fetchAddItemToCartPostApi(Object params) async {
    var response = await _httpHelper.post(url: NetworkConstant.addItemToCartPostApi, isRequireAuthorization: true, requestBody: params);
    return response;
  }

  ///--------------------------------------------------///
  ///-------->>>>>>>>>>>>--Get Api-<<<<<<<<<<<<<------///
  ///-------------------------------------------------///

  ///--------- category List get api
  static Future<CategoryListModel> fetchCategoryListGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.categoryListGetApiUrl, isRequireAuthorization: true);
    return CategoryListModel.fromJson(response);
  }

  ///--------- product List get api
  static Future<ProductListModel> fetchProductListGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.productListGetApiUrl, isRequireAuthorization: true);
    return ProductListModel.fromJson(response);
  }

  ///--------- Vendor list get Api
  static Future<VendorListModel> fetchVendorListGetApi(String categoryId) async {
    var response = await _httpHelper.get(url: "${NetworkConstant.vendorListGetApiUrl}$categoryId", isRequireAuthorization: true);
    return VendorListModel.fromJson(response);
  }

  ///--------- Product Details get api
  static Future<ProductDetailsModel> fetchProductDetailsGetApi(String productId) async {
    var response = await _httpHelper.get(url: "${NetworkConstant.productDetailsGetApiUrl}$productId");
    return ProductDetailsModel.fromJson(response);
  }

  ///--------- Dashboard get Api
  static Future<DashboardModel> fetchDashboardGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.dashboardGetApiUrl, isRequireAuthorization: true);
    return DashboardModel.fromJson(response);
  }

  ///--------- Address List get Api
  static Future<AddressListModel> fetchAddressListGetApi(int page, int pageSize) async {
    String params = "?page=$page&pageSize=$pageSize";
    var response = await _httpHelper.get(url: NetworkConstant.addressListGetApiUrl + params, isRequireAuthorization: true);
    return AddressListModel.fromJson(response);
  }

  ///--------- notification List get Api
  static Future<NotificationListModel> fetchNotificationListGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.notificationListGetApiUrl, isRequireAuthorization: true);
    return NotificationListModel.fromJson(response);
  }

  ///---------- profile get Api
  static Future<ProfileModel> fetchProfileGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.profileGetUrl, isRequireAuthorization: true);
    return ProfileModel.fromJson(response);
  }

  ///---------- cart list get Api
  static Future<CartListModel> fetchCartListGetAPi() async {
    var response = await _httpHelper.get(url: NetworkConstant.cartListGetAPi, isRequireAuthorization: true);
    return CartListModel.fromJson(response);
  }

  ///------------------------- Delete Account------------///
  static Future<dynamic> fetchReadNotificationGetApi(String id) async {
    var response = await _httpHelper.get(url: NetworkConstant.readNotificationGetApiUrl + id, isRequireAuthorization: true);
    return response;
  }

  ///------------------ Delete Account------------///
  static Future<dynamic> fetchDeleteGetApi() async {
    var response = await _httpHelper.get(url: NetworkConstant.deleteAccountGetApiUrl, isRequireAuthorization: true);
    return response;
  }

  ///--------------------------------------------------///
  ///-------->>>>>>>>>>>>--Put Api-<<<<<<<<<<<<<------///
  ///-------------------------------------------------///

  ///--------- Update Address Put  Api
  static Future<dynamic> fetchUpdateAddressPutApi(Object params, String productId) async {
    String id = productId;
    Map<String, dynamic> response = await _httpHelper.put(url: NetworkConstant.updateAddressPutApiUrl + id, requestBody: params, isRequireAuthorization: true);
    return response;
  }

  ///--------- Update Address Put  Api
  static Future<dynamic> fetchDefaultAddressPutApi(String productId) async {
    String id = productId;
    Map<String, dynamic> response = await _httpHelper.put(url: NetworkConstant.defaultAddressPutApiUrl + id, isRequireAuthorization: true);
    return response;
  }

  ///--------- Update Address Put  Api
  static Future<dynamic> fetchAddAddressToTheCartPutApi(Object params) async {
    Map<String, dynamic> response = await _httpHelper.put(url: NetworkConstant.addAddressToTheCartPutApi,requestBody: params ,isRequireAuthorization: true);
    return response;
  }

  ///--------- Remove Item From Cart Put Api
  static Future<dynamic> fetchRemoveItemFromCartPutApi(String productId) async {
    Map<String, dynamic> response = await _httpHelper.put(url: "${NetworkConstant.removeItemFromCartPutApi}$productId" ,isRequireAuthorization: true);
    return response;
  }

  ///--------- update Quanitity Put Api
  static Future<dynamic> fetchUpdateQuanitityPutApi(String productId, var body )
  async {
    Map<String, dynamic> response = await _httpHelper.put(url: "${NetworkConstant.updateQuanitityPutApi}$productId" ,isRequireAuthorization: true,
        requestBody: body );
    return response;
  }

  ///--------------------------------------------------///
  ///-------->>>>>>>>>>>>--Delete Api-<<<<<<<<<<<<<------///
  ///-------------------------------------------------///

  ///--------- Remove Address Delete Api
  static Future<dynamic> fetchRemoveAddressDeleteApi(String productId) async {
    String id = productId;
    var response = await _httpHelper.delete(url: NetworkConstant.removeAddressDelectApiUrl + id, isRequireAuthorization: true);
    return response;
  }

  ///--------- Delete Notification Delete Api
  static Future<dynamic> fetchDeleteNotificationDeleteApi(String id) async {
    var response = await _httpHelper.delete(url: NetworkConstant.deleteNotificationDeleteApiUrl + id, isRequireAuthorization: true);
    return response;
  }

  ///---------  cart item Delete Api
  static Future<dynamic> fetchEmptyCartDeleteApi(productId) async {
    var response = await _httpHelper.delete(url: "${NetworkConstant.emptyCartDeleteApi}$productId", isRequireAuthorization: true);
    return response;
  }

  ///--------------------------------------------------///
  ///-------->>>>>>>>>>>>--MULTIPART Api-<<<<<<<<<<<<<-----///
  ///-------------------------------------------------///

  static Future<dynamic> fetchUploadImageMultipartApi(File imageFile) async {
    Map<String, dynamic> response = await _httpHelper.uploadImage(url: NetworkConstant.uploadImagePostApiUrl, imageFile: imageFile);
    return response;
  }
}
